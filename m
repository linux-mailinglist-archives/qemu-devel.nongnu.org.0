Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448414DB062
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:07:54 +0100 (CET)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTNX-0001mg-W2
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:07:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUT9V-0008PV-TN
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUT9T-0006Ea-5G
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647435197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWimiNJhFj0nZDlK5W4L1jowHyozhoM7FWDdlg2b4HE=;
 b=boPVcyG0swY4U9gAAxhSrxZj8mxUsta/CfzeRCtdXrjpfFMdA0xeuWpg4Eg2INvrOR8WmR
 gUtGjb3t0bSBa08ustcPLiNDZFXT2PM51eRDIonMGr2CDnBE2lrtJUdR3LGyeg/XxS2+T6
 kSfdXuVj5X40fh0Jdsvg6R8NssNNs1Y=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-IoAYywZjMMS9WsWFttUl5g-1; Wed, 16 Mar 2022 08:53:16 -0400
X-MC-Unique: IoAYywZjMMS9WsWFttUl5g-1
Received: by mail-yb1-f198.google.com with SMTP id
 h8-20020a25e208000000b00628c0565607so1911278ybe.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EWimiNJhFj0nZDlK5W4L1jowHyozhoM7FWDdlg2b4HE=;
 b=PFJrulmXNX5LLh0dKEqq3fTUztV/fMpNtkzrrXdzt8T2s61q41hU3Eyu8azYlUe8Gh
 Q5gywrdA6tkcSm8TJ4KuHeMHye82IDbiPJLFeAGRgNHaI76syjatlQni91cXHGKwfMI7
 Y6z+/cBpU+g8KbQGtDrujwMpODoVDGh1mTA6g+NZWsAZSpFB2by3tzz9Lv7YXin1UzO4
 /yJ7bbGNd8YTlDjwd5DfdZgkd2TF6w8VTdEm8PJgDciB+gWd/Z/2SdXEIqBje1JkBj4P
 0K45DyhY0nnjfUWxSl+uYDU8Df7N6+Hl6dg1D2KzIJnmKW6Qv2j3jcvBm26wQHv3bRqJ
 ZNQA==
X-Gm-Message-State: AOAM530VidFSObVQL6nF1Ye40IQA72Svb5FId3k0PzNM9C2HNGRbAWZ6
 kKKrCYNlQOxkYEmaztWJeceERGhxGbFfAc+8psiKYlT3iaWgUoBNSzaQjRwcrMYkwJTZceurfSe
 c4SAPHAgnUhxQDpIdXMSuD442EtkFpis=
X-Received: by 2002:a5b:152:0:b0:629:2b85:4495 with SMTP id
 c18-20020a5b0152000000b006292b854495mr28624057ybp.559.1647435195998; 
 Wed, 16 Mar 2022 05:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrSCRoGglTY0Ots3DzFYOI6hPhPmyrlxUoEHAtJZveEw5TpHFGIACnzIsphiuNalA6+ZaxEovl2BN4d3LqRaw=
X-Received: by 2002:a5b:152:0:b0:629:2b85:4495 with SMTP id
 c18-20020a5b0152000000b006292b854495mr28624037ybp.559.1647435195836; Wed, 16
 Mar 2022 05:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095459.2613885-1-marcandre.lureau@redhat.com>
 <877d8u5b7o.fsf@pond.sub.org>
In-Reply-To: <877d8u5b7o.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 16:53:05 +0400
Message-ID: <CAMxuvazfG9y4wODW3rHL_Xj9+H1SwDy8aESZKW89hwU=k7LLjg@mail.gmail.com>
Subject: Re: [PATCH 26/27] tests: replace free_all() usage with g_auto
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Mar 16, 2022 at 4:33 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Use more idiomatic glib/auto-style code.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This is a bit of an improvement, but by its own, it's a rather weak
> justification for the previous patch.  Do you have more uses of
> g_autoptr in the pipe?


There are a lot of similar g_auto cleanups to be done in qemu code
base for QObject types. But I started with those tests, because they
use a pretty unorthodox free_all pattern and that shouldn't be
repeated.


