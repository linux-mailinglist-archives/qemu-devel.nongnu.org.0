Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE46F796B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 00:54:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puhpi-0008WH-4D; Thu, 04 May 2023 18:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puhpe-0008W8-EH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puhpY-0003Fi-UF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683240823;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2Ly/JCwzSNIm1xCfO8zJ3mJXdoAliRA3y+4MzV2gFE=;
 b=cJav30I6pfTYwAcBX6+YfJoyV/XFWxx72vs9grb49KpjKPtl8MkXrhsiSOu+DNeU9yxPqM
 wJ8RHAamGjRTdelW63NoJ6W9StWmjraFQO9EiCOujCwMzvE1uP7yQL/GkRGbxarjmRJz2+
 1ValvS8aV777gMHw5xFVbvdEc/Yx/k0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-RrtCrwvXNSyGMLjh4bA4Ow-1; Thu, 04 May 2023 18:53:41 -0400
X-MC-Unique: RrtCrwvXNSyGMLjh4bA4Ow-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f16fa91923so6347575e9.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 15:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683240820; x=1685832820;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I2Ly/JCwzSNIm1xCfO8zJ3mJXdoAliRA3y+4MzV2gFE=;
 b=etPKJTOo+47Pplle5yDKy3OwZ8GZnefNt/qtNOMuvSbaI9c5foTJN0avjWepXOZqkl
 mzwkj+0fn2Vpcz+qrXL4wnICMM2jSFmccT2YZLmB5JsN12WIz9sSSXVsKg0wP3D4l+do
 l6nTRvPjN4CFfBJB8as2bn1S/u2N5HmVCJzsZNCmnAHoz/eKBzpLBoeTTaGSpHxUEO6F
 4uBII6XQAYC/ApKwWo4MUQPjp/v3tuwxbBACgKeqrNRdwuPkLTHfsS5vyXbR8sfGwSxY
 /gVtArDKnkMbbAajJMhpbttep2REq2iCMjN6cRI0rFc6yvwft6HAb/ZTV868Z7fllPDN
 +IIA==
X-Gm-Message-State: AC+VfDxU+7PXxmvYCUyNsNIOH5rW4cpoc+qBieWF7+lsNe34WB2J4QT5
 x8fKF6MT74Ev6H17TKnvLUB5lFYQYlJBcqyVw+OTuVEEkH0hiYCOrmMA7j82mt1uBe7rBB4S4Fv
 26RMfxxhW/mouBB8=
X-Received: by 2002:adf:e84e:0:b0:306:2e04:5925 with SMTP id
 d14-20020adfe84e000000b003062e045925mr3597210wrn.17.1683240820764; 
 Thu, 04 May 2023 15:53:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wt0WJ01UlDnHgu0EGCvLh8sVmGSWvz+YimYiMSBn9Za7gP+M+PYMyrDt85NJD/WP0isXmsw==
X-Received: by 2002:adf:e84e:0:b0:306:2e04:5925 with SMTP id
 d14-20020adfe84e000000b003062e045925mr3597201wrn.17.1683240820510; 
 Thu, 04 May 2023 15:53:40 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b00306344eaebfsm423820wrx.28.2023.05.04.15.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:53:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH 4/5] migration/rdma: It makes no sense to recive that
 flag without RDMA
In-Reply-To: <ZFPl0Slq5vX4VuBl@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 4 May 2023 18:05:21 +0100")
References: <20230504114443.23891-1-quintela@redhat.com>
 <20230504114443.23891-5-quintela@redhat.com>
 <ZFPl0Slq5vX4VuBl@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 05 May 2023 00:53:39 +0200
Message-ID: <87y1m3ogi4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> In $SUBJECT   s/recive/receive/
>
> On Thu, May 04, 2023 at 01:44:42PM +0200, Juan Quintela wrote:
>> This could only happen if the source send
>
> s/send/sent/

Fixed.

>> RAM_SAVE_FLAG_HOOK (i.e. rdma) and destination don't have CONFIG_RDMA.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/qemu-file.c | 8 --------
>>  1 file changed, 8 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Thanks.


