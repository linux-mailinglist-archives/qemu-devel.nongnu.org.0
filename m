Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA0552039
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:20:19 +0200 (CEST)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JCM-000699-GC
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J72-0000sz-Ea
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J70-0000K2-9D
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738085;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHITf9wauGuPtFWgm97NelxONqg8mhPuQIXFB+1y1uI=;
 b=HVo/CzM7zfKwLfwz/pAfGoEY4/xjKFLWGgejbCRBPd8HhmJ6CXRiTeVDzlnQBQTiHbswIf
 RUFCqbke7e97URH2L0wI9J8Hst2FdyOMwQAQ7CgVDWKjU6uB1DO9eDICUhpZbi4VQoqWHk
 RjMJZ+0bJXA+vgHCcko4BwuOaGveOcU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-xZTzmYv7OXuf-fXAPRTQVA-1; Mon, 20 Jun 2022 11:14:44 -0400
X-MC-Unique: xZTzmYv7OXuf-fXAPRTQVA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so3404567wmr.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHITf9wauGuPtFWgm97NelxONqg8mhPuQIXFB+1y1uI=;
 b=24TMFy6TEqzohkwZuPJ3mtL+oBYTi78kJQWW+Juui1F/bC3DWCu8E+ywbDjhY9crSq
 OzM6rmTCqDg9HrefKomK+Qj9t6nbFicz4Q3HHNZXHO/s9YWp4nfNB5+IpfcbGIsvncit
 1USeWTlgdkpZ5lHNJF6Cym/UOnTZAQqLHWb6NRn0EHK/6g2cQp3Ej6LC7fmJmBN+YRU6
 GTza6wSHWT3fM5qWm/Uxjd9QvcRHyOVSTb36tdAZekW1XNIjbUzTlqM3flnRaz9fn0uM
 16FspVNUfElHOfe+75RWdYZrXOXur+pwATsNOlEaWC9qp4wdWc0FAVo/DGLiiz3fAn1q
 61nA==
X-Gm-Message-State: AJIora9DNd/5BTOPePaKCNxY7+96pcY6/Dfs2C6TIsSbOZk4/Cn4w+Zc
 X8kaIKum1R3IMpinLFBLhGKr9OZOPzbgbSLTnFAPDHiHZJPaqBtEPOE4prLSAeo0rKzDrOvtPme
 Y0Qf12jPrGpJ6P7g=
X-Received: by 2002:a7b:cb58:0:b0:39e:f121:f7d4 with SMTP id
 v24-20020a7bcb58000000b0039ef121f7d4mr15495666wmj.174.1655738083339; 
 Mon, 20 Jun 2022 08:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v66CXo49DH1zRDaw4IA7c+HdMCoNfqT4M0IztqOXYCmWl7PbrkjVQ1WwfZuCyG4FYa9nWBfA==
X-Received: by 2002:a7b:cb58:0:b0:39e:f121:f7d4 with SMTP id
 v24-20020a7bcb58000000b0039ef121f7d4mr15495636wmj.174.1655738083100; 
 Mon, 20 Jun 2022 08:14:43 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1c2501000000b0039747cf8354sm14804611wml.39.2022.06.20.08.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:14:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 07/21] migration: rename qemu_update_position to
 qemu_file_credit_transfer
In-Reply-To: <20220620110205.1357829-8-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:51
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-8-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:14:41 +0200
Message-ID: <87letr2wpq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> The qemu_update_position method name gives the misleading impression
> that it is changing the current file offset. Most of the files are
> just streams, however, so there's no concept of a file offset in the
> general case.
>
> What this method is actually used for is to report on the number of
> bytes that have been transferred out of band from the main I/O methods.
> This new name better reflects this purpose.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I started, but not finished a change to not use qemu_file to limit
transfer, i.e. to not need this code at all.  but it is not finished,
so.


