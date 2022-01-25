Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A570F49B28A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:04:49 +0100 (CET)
Received: from localhost ([::1]:46832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJd1-0000dp-IW
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:04:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCJX7-0006Ju-9W
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCJX5-00035a-5D
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643108318;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+n55kLDReFz2e5cdsN2xWDzy8scNpDzZ6WAxdHIBD3o=;
 b=ekBd22gbasTuTnYS4LOmywnlMGPJQ+ngDh8qdNj+I1vVXXGRBq29RehbPARUebRquJtxRr
 niFiPupbt2KkVnAkR6MTafMjwk6jSoi4g6xYNfgQaVNKmPnKr58xgE9Sna4mN8UoYLOeM5
 MvBkEVS2p03lz2ONn7bqkUu9rKFpXr0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-MHGVi6YLO4CPQztIHh8iYQ-1; Tue, 25 Jan 2022 05:58:31 -0500
X-MC-Unique: MHGVi6YLO4CPQztIHh8iYQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r26-20020adfab5a000000b001d67d50a45cso2871039wrc.18
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+n55kLDReFz2e5cdsN2xWDzy8scNpDzZ6WAxdHIBD3o=;
 b=4+CeimCCnEuLtKwrLLLcT3skQ7RWGg0OsOPpCRKNTHm6Zh9FyP7u1WGZYcxsjZTMbH
 7tpB87/xuGJmwwiYm5x1MvL6L06ikL2lWWHGASre+QWH1XponWc+mg0Wg9hzUGPwVCmG
 FKrhk+s87fdk1myCfjxaZBJBxC5m/slaaq8+obBXPoDXMfPLwj708T45Uq8VDHoZTzRR
 B+aHv6vDVBm2Xeg8/uMaZ4ICwGombapk7qp5YELx64yvOI6oqFpMpfGTlpqHlxw6H6jU
 c3ChzC/e/yXjY7x27mUQ0IS1ZGa5nojeImWLq0/MjWoGqAHad6a6v5NDYR7nLzpUpBek
 zRtA==
X-Gm-Message-State: AOAM531XSP+Gl4Fqqo4nVvX/ImxMnAScPHqsdvIGDu/aYld0Sfks6OzI
 2wW/8xIN2Fo4JGv9UCF0DYczTqcRME82RNkmGPF7MrG7dmg0kLMWUesz+togsBHBFfl2+zn0GVX
 NlX685v1OzDNSGLA=
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr2375900wmq.162.1643108310432; 
 Tue, 25 Jan 2022 02:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGpe5g0i9QR2Gtw9KBIxsWv+B6BgwJJUBZQkauzv/fm2IL2dXuXOZloNhLWwiTGPBFmT6R+Q==
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr2375880wmq.162.1643108310162; 
 Tue, 25 Jan 2022 02:58:30 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id k10sm23952wmi.1.2022.01.25.02.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 02:58:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: "Startup" meeting (was Re: Meeting today?)
In-Reply-To: <b3d70518-256d-2bd0-5979-ff96a1154fd1@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 25 Jan 2022 11:45:11
 +0100")
References: <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
 <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
 <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
 <YeWjtxEcbb6jcbi8@redhat.com>
 <D36E42AD-05A6-4139-8647-07C9CEF3D659@greensocs.com>
 <87h79sw64t.fsf@secure.mitica>
 <b3d70518-256d-2bd0-5979-ff96a1154fd1@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 11:58:28 +0100
Message-ID: <874k5srsiz.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Burton <mark.burton@greensocs.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> On 1/25/22 09:50, Juan Quintela wrote:
>> Mark Burton <mark.burton@greensocs.com> wrote:
>>> All, I believe we will have a followup meeting this coming Tuesday
>>> 25th January, at 15:00 (presumably using the same link:
>>> https://redhat.bluejeans.com/5402697718).
>>>
>>> We (GreenSocs/Xilinx) would like to quickly show what now =E2=80=98work=
s=E2=80=99, and to give an update on the patches.
>>=20
>> I send the call for agenda already.
>>=20
>> We are having the meeting.
>
> Do we need to stick to bluejeans, or can we switch to something more
> generic to easily record the call, and be able to start when Juan is
> not available?

Hi

Anyone from inside Red Hat can start the call.  So I think that starting
the call shouldn't be a problem.

If I remember correctly, one of the reasons for using bluejeans was that
in the past we used to be around 40 people on the call, and that was not
easy to setup.  Perhaps today it is different.

About recording, I will ask everybody if they agree on the call and we
can record it.  On the past we _didn't_ want recordings, but I can't
remember the reason.

Later, Juan.


