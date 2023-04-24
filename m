Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A82E6EC7BA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 10:16:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqrM8-0007qr-4y; Mon, 24 Apr 2023 04:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pqrM6-0007qE-7u
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 04:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pqrM4-0003V2-Jm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 04:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682324124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKq3wLaa5Dk2O+3gt9M/UBziLsgLrt+5WtpX9blBTUM=;
 b=G+QSRvGHnrYaUCLPVTRs2oX7Mzhxb3N+WM/RzvJFPngcLducyTq7QkZf2FNmkWhv5vjfS8
 0kBQStR/9NOj50AnHe+ia3DaqT/06hBLCMBwtIeqIWEvVTfstHts4tSY276oef+302rfrJ
 a2Z7hSdnpe30gjbX2X5yPqKyF6RBMOM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-mKZtkOXMMm6xU9fhLNJMaQ-1; Mon, 24 Apr 2023 04:15:21 -0400
X-MC-Unique: mKZtkOXMMm6xU9fhLNJMaQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ef3ca5b5afso55915861cf.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 01:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682324121; x=1684916121;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BKq3wLaa5Dk2O+3gt9M/UBziLsgLrt+5WtpX9blBTUM=;
 b=UMFQH6fDLZBm4koG8nKLprDQucu7dzyARV+zWFJHudBsZ88xLLdZ9PW4gkujN2hf58
 3JxnNbB7IIdWr6veWOCzaK/AF0RPjSoqJAOLGG/EIXTsffNgs0U4hYl61XMFJVcHFu/7
 9wRELNbeTJdCFA6cqXHUNJV8410D0RTcOuI1WNalxznGJy1y9ByWfsUCDNyRHWEW17XE
 dXWmIaVqAELWOSWKgDB6sURuk9GK/UnUPUMUOVnCEAU9xB4jLYlTJbjXUcuR1nQiCgOH
 UkJgGpQpvZ86CH+4hKs9C522CLo6rHhQTiSNtYtUvhIBcF/AaQPoMxWP8+Z/M+V9B9GC
 3zsw==
X-Gm-Message-State: AAQBX9fO7WcJxlAPmvxr2QRMn+/W+0JE3pFK3ZvK7PKxXEk4BBNtjBcv
 nQlvSEgZb7i5I7eZB/HIs+x33IwqEwy1dj/DXSKKSSUFZhKkD6YpoIPyb3cK4ebNlIsfqZlZf9/
 AbMdb5FT9KBHGydE=
X-Received: by 2002:ac8:5c01:0:b0:3e1:59e8:745a with SMTP id
 i1-20020ac85c01000000b003e159e8745amr20338929qti.3.1682324121269; 
 Mon, 24 Apr 2023 01:15:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zn6Vo97qfbQ4AWZfOqwPN2PeaID9A+xk632stg+YNfMdTxu1GC6eajNk26Jr1JFQ3W9moMDw==
X-Received: by 2002:ac8:5c01:0:b0:3e1:59e8:745a with SMTP id
 i1-20020ac85c01000000b003e159e8745amr20338905qti.3.1682324120970; 
 Mon, 24 Apr 2023 01:15:20 -0700 (PDT)
Received: from [192.168.149.117]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 g7-20020ac84b67000000b003ef231cceeasm3422378qts.23.2023.04.24.01.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 01:15:20 -0700 (PDT)
Message-ID: <e56994f3-d906-89e3-3387-df65fb2c4b36@redhat.com>
Date: Mon, 24 Apr 2023 10:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] block/monitor/block-hmp-cmds.c: Fix crash when execute
 hmp_commit
To: wangliangzz@126.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, Wang Liang <wangliangzz@inspur.com>
References: <20230423110254.35672-1-wangliangzz@126.com>
Content-Language: de-CH
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20230423110254.35672-1-wangliangzz@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 23/04/2023 um 13:02 schrieb wangliangzz@126.com:
> From: Wang Liang <wangliangzz@inspur.com>
>
> We need to get the aio_context before calling the blk_is_available.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1615
> Signed-off-by: Wang Liang <wangliangzz@inspur.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


