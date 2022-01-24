Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2730D498CB2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:29:49 +0100 (CET)
Received: from localhost ([::1]:50826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC52C-0004d6-5T
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:29:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC4I3-0001at-3V
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC4Hx-0004b5-Rh
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643049717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbJIrKltGWCM3zQGkHzsUfuP7w3Cm9Zjegu1+UpnIos=;
 b=ceXVFfcuO+qMQgTmYfTvlIes9HVGsGUBHKZMv5tbNcRlH3xNintxKSk3mGsaqEG40N/0YM
 Q93+DQphKKc1/O4VKMOdTssDPZIwVVU3CiU/oO1oAYe5mu+veHAa5Y9CzRM4+mKli07KHU
 X5cdE1Aa+Z4EywfAYGGomp88k2oG2gQ=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-GxB2jFfROXO8U_JNM1larA-1; Mon, 24 Jan 2022 13:41:49 -0500
X-MC-Unique: GxB2jFfROXO8U_JNM1larA-1
Received: by mail-vk1-f200.google.com with SMTP id
 t3-20020a1f2d03000000b0031df55b443cso1769518vkt.16
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 10:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NbJIrKltGWCM3zQGkHzsUfuP7w3Cm9Zjegu1+UpnIos=;
 b=GE062UIPEI+Q1alDDAeHq5MsDJIgN0LYbyY6xzB1dr3erGFAMfCoA86J0/5dCa6Dzt
 juEH4xiWvIMKP7e+6ckrdOWDLY07J9hp0hub2yA2mW5S/WDK+TbIFWl9Ykqtq2qBQDAD
 F53gi+EJve0lzKUGO8lbD/c7dw0AZHDw5RSrhsMgAV2kbijtQl15w2oRxNdRbA+VbA6a
 I8cbweGk+UNQL1yCgCv2wd0q2D+4GuwWMqmUwCKwqlsONERFAE9zLTFbvMhC7zwDgwa2
 NCfDWZkREwtQXVUMotbi5UGwMWPKc2ntyxANgAusPI5mFioSynsehbxwIWJnrlBmmfpO
 oXOA==
X-Gm-Message-State: AOAM530ZtLI1SM2QOSuydhAS4Uo/HIaC12VgydAoiUYJhb2ZJh+O/Zon
 9Tr2Mni1sZVvRUUU+Dl097QD4VnE8V8yD2fKf/qDdUtgDP7b6scIAXtyGkJEGx0eM86vwRunyTi
 esgBJXSQ7BqzZD4XZ3zC6SVYhC75341o=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr6011767uak.79.1643049708508;
 Mon, 24 Jan 2022 10:41:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK3pZm7RnTFdPuc6dkjAICZYdKEcpjDJfj9DTAD+l1GOu/ZuGTWS0rj65plTOTowCJVn5cihF3L58xqDZU36E=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr6011752uak.79.1643049708296;
 Mon, 24 Jan 2022 10:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20220120142259.120189-1-hreitz@redhat.com>
 <CAFn=p-YKMREeM4PxhiTQFfiovt=WN7cW-CdiVSVfbRbkvH+aog@mail.gmail.com>
 <3a718aaf-44c7-e780-fa1c-1cbe3d769e79@redhat.com>
In-Reply-To: <3a718aaf-44c7-e780-fa1c-1cbe3d769e79@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 24 Jan 2022 13:41:37 -0500
Message-ID: <CAFn=p-ZWL5zKOrGxGnzYe+r+OtX3wRcXTw9v0UwwRObBMeziaw@mail.gmail.com>
Subject: Re: [PATCH v2] ide: Increment BB in-flight counter for TRIM BH
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 4:06 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 21.01.22 19:47, John Snow wrote:
> >
> > There's no regression test, but I will trust you (and Paolo) that this
> > solves the bug you were seeing. It makes sense.
>
> There is one in the BZ linked, but I don=E2=80=99t know where we=E2=80=99=
d put it into
> the qemu tree...  I=E2=80=99ve explained in v1
> (https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00024.html)
> how I didn=E2=80=99t find a way to write a qtest for this, and so resorte=
d to
> writing boot sector code to reproduce the assertion failure. Now, we
> could put that as a sample image into the iotests, but that=E2=80=99d jus=
t be...
> wrong.  (Is there a place where something like this would belong?)
>

No idea. I guess it'd be more of an avacado-test level thing, but I'm
not sure I know how to do it quickly.  I'm worried there's lots of
little things like this that'd be nice to test against, but "where do
we put this" is a recurring problem.

(Definitely not insisting on this being solved, and also wise enough
to not want to volunteer.)

> > Reviewed-by: John Snow <jsnow@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
>
> Thanks!
>
> Hanna
>

--js


