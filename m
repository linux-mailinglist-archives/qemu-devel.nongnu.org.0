Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D190B4DB188
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:32:50 +0100 (CET)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTlh-0001EU-U8
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:32:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUTR8-00022i-Pe
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUTR7-0002Au-1w
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647436292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoGDlpDToAbFEpaP06NjgKS3QjlBu7YQ5AglUS9KfP8=;
 b=CG/uNTEW1lHOTKogBf2xy0oJ4Jfs+3s+qygazC6Z18mzm2wG8O1n9fp6HEE6dgf8IEm4U1
 OI//+vp67VOar9aKWjXxI8AtFddbWcwhFuFpvfILg+BMr7t1lc7A4mdf92acP4W4h4e5wK
 vEufksGKHdmD5wdjqIEmRUFGYhcJokw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-79o3wfbeP0aWu4dji5jdDQ-1; Wed, 16 Mar 2022 09:11:29 -0400
X-MC-Unique: 79o3wfbeP0aWu4dji5jdDQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 b12-20020a056902030c00b0061d720e274aso1883545ybs.20
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UoGDlpDToAbFEpaP06NjgKS3QjlBu7YQ5AglUS9KfP8=;
 b=Bh50J37NLZpQDkL2uEl4Yv9zZHY0kwOOW4ZT2s0kLZvyBzAsF5+p3m6nDzOQkiYhLH
 rEKLEQnxewez1MDAwFmrBUNqlU/ZV6wS5iZRoj21wziXKa6TG3KMR540DeeMZPoZYcYk
 TAE+U4rnH6JIEic+5olwOlZ5oAZcqef9Sdiom6RbZ9O5vw3N5b46rnbdU7vXhOMlVelU
 K5CJM2S4W7onTmpp25T5d5qnF2+KOnCnQ/wkHdvDvnvE5nXW0SDP+21om3IgWDmkaLuc
 BvZ5ZlYQW+xD8hwr5beHQLrz7MtxiLXKkcBBTuaJoKaGvZgyUUDCB+OGMuLsl19TLByl
 IaYA==
X-Gm-Message-State: AOAM530/gpp/tWVCfbRjhize5T/3xIoLGPxqwk1kCI++XxCkKS8EOIGh
 EGcdqnVKHTLMgmw7MDbJr+k0dGZNeeB0IAXQGgXAsBEVDuKR6IPe+it9wjMmHd1Oag2dCuuEgD2
 aZMWIZeCxTOQ64IOrl8PIrGYQR+28qlw=
X-Received: by 2002:a5b:152:0:b0:629:2b85:4495 with SMTP id
 c18-20020a5b0152000000b006292b854495mr28715534ybp.559.1647436289145; 
 Wed, 16 Mar 2022 06:11:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIoFpUqBwAubq2hiA39xkE//TZ82xqmTDneQsVk1LTHiD70NtAEPnv8c1kzrWjGyXazSDl6bDh/K8BJDOcRJE=
X-Received: by 2002:a5b:152:0:b0:629:2b85:4495 with SMTP id
 c18-20020a5b0152000000b006292b854495mr28715508ybp.559.1647436288899; Wed, 16
 Mar 2022 06:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095459.2613885-1-marcandre.lureau@redhat.com>
 <877d8u5b7o.fsf@pond.sub.org>
 <CAMxuvazfG9y4wODW3rHL_Xj9+H1SwDy8aESZKW89hwU=k7LLjg@mail.gmail.com>
 <87bky6xdav.fsf@pond.sub.org>
In-Reply-To: <87bky6xdav.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 17:11:17 +0400
Message-ID: <CAMxuvax13xYm0=A31VJsuWUhvuj7VLW+4Pg79d0UqAh=VBpxAw@mail.gmail.com>
Subject: Re: [PATCH 26/27] tests: replace free_all() usage with g_auto
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Mar 16, 2022 at 5:00 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > Hi
> >
> > On Wed, Mar 16, 2022 at 4:33 PM Markus Armbruster <armbru@redhat.com> w=
rote:
> >>
> >> marcandre.lureau@redhat.com writes:
> >>
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > Use more idiomatic glib/auto-style code.
> >> >
> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> This is a bit of an improvement, but by its own, it's a rather weak
> >> justification for the previous patch.  Do you have more uses of
> >> g_autoptr in the pipe?
> >
> >
> > There are a lot of similar g_auto cleanups to be done in qemu code
> > base for QObject types. But I started with those tests, because they
> > use a pretty unorthodox free_all pattern and that shouldn't be
> > repeated.
>
> Would it make sense to add this the list of bite-sized tasks?
>

Yes, g_auto cleanup is already covered:
https://wiki.qemu.org/Contribute/BiteSizedTasks#Code_Modernization


