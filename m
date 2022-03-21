Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EE74E317E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:11:47 +0100 (CET)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWONW-000335-56
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:11:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOLE-0001ma-67
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:09:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOL8-0000J7-Oq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wCZxfjzkDQrMGvCm5i/TUPVp+SOSTbyWa8MFOmvveKA=;
 b=OwETOWMOroM3Ov0WXHz7p8td7PV2Xvz2tZR8iKukQJFiDqn53TBEkMehVywTp4elADkDj4
 KSQuqwJqRD083J06/lYXe16ahB0Jz+7bGYJ9g1Pf6oq5c+RbK1ixmIlxkP50sH5tOe0Fpt
 WoLEUW5WTGisB/N1h71uueA5gg6Kvmk=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-cIPEwUgaN72XJp04RWN3YQ-1; Mon, 21 Mar 2022 16:09:16 -0400
X-MC-Unique: cIPEwUgaN72XJp04RWN3YQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 d11-20020ab0724b000000b003513507a46bso6517729uap.16
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 13:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wCZxfjzkDQrMGvCm5i/TUPVp+SOSTbyWa8MFOmvveKA=;
 b=A3Oz7MPwbjL6v5Pt7/NH6h68NnmfQV8DcuyZHVi0TD5OufY3kY9goaVfbVzYBTdPi8
 ousESt1aEViTVgIPOIjfPdqVsuGRL4KE39K/VcTkf82ktcHUsrofhVV3sYD0ZsAoOwXX
 YZQw+sZmWfeoCdu2jLFeEtakTh9s7JfRom4mDw6BvHFZRNfDpgz6Yq6lAEkRXTLtL8D+
 2pfEl4vvl7n+u+HGTi9Tw0zO7MpGUsCFG2QRH/NaxVH1NUj7VLmDengxXfFpwhMZ1EHQ
 AAwR6Dln+Ct02O2xDXkcxTAQi2RPK6giLgEXfSq9Q8g+cnfy3TCtcu26SIyWoslj6GOd
 3AZQ==
X-Gm-Message-State: AOAM5339SLfa/PgcK754DxPa6Iom6UxPo1B4O0RoGNzsY8mxiMBwVtFl
 8pH8e48aOr/vLyphJdr/4RYmqlGK+DPG8FQICpIxsix7/bp5fI/kKmgYSabuHthPiYn/RL43QZ+
 wF8UsG3J4Q0AzIiEXlZ9jo48K48fDMPc=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr8757494vkf.35.1647893355612; 
 Mon, 21 Mar 2022 13:09:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5USQ+04L4l4PdwSSoojf6PutXuaomViRs2hPDTbzktEz1UCvMRrjrU7rryOn/it5GUzJeE6rHI54F054/Nw8=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr8757486vkf.35.1647893355392; Mon, 21 Mar
 2022 13:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-16-jsnow@redhat.com>
 <20220321182205.s7fuxglvfbj3qjyr@redhat.com>
In-Reply-To: <20220321182205.s7fuxglvfbj3qjyr@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 21 Mar 2022 16:09:04 -0400
Message-ID: <CAFn=p-aPpH=-dVJVLtf=JAL4YCuGOS=ZfLcCL5rRnDwq+V=XwA@mail.gmail.com>
Subject: Re: [PATCH 15/15] iotests: make qemu_io_log() check return codes by
 default
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 2:22 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Fri, Mar 18, 2022 at 04:36:55PM -0400, John Snow wrote:
> > Just like qemu_img_log(), upgrade qemu_io_log() to enforce a return code
> > of zero by default.
> >
> > Affected tests: 242 245 255 274 303 307 nbd-reconnect-on-open
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qemu-iotests/iotests.py                  | 5 +++--
> >  tests/qemu-iotests/tests/nbd-reconnect-on-open | 2 +-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
>
> If I'm reading the commit message correctly, 'Affected tests' are all
> tests that used qemu_io_log, but only nbd-reconnect-on-open needed a
> change because it was the only one that explicitly tested a scenario
> that triggers an expected non-zero status.

Yeah, it was meant more as a test aid. I'll change the wording a little bit.

>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks. By the way, did you check out iotest 040 in all of this? There
*was* a failure I wasn't sure how to address, I wrote about it in the
cover letter.

--js


