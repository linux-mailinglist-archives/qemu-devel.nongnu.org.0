Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C6602C24
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:51:49 +0200 (CEST)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okm4S-00076V-4V
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1okldb-00017h-6z
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:24:11 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1okldR-0000CN-Nw
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:23:56 -0400
Received: by mail-ej1-x629.google.com with SMTP id w18so31711496ejq.11
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4a80rrA4m79gFkPnjEk8AuHwLVgG2dijj6hS8YSip3Q=;
 b=d4Qd/3qI0fUUv5YVsNtIt34R+RoviIfl00MkCqiWAb1Bc0bY2JiS9iGjyyICQL25fG
 bwP5aMltk0nh6JTyY8lxDKXgpYnzcqCEoHMUbMGugphc26nA/hYsBoYG6uoy/WUukBbp
 LYgkhYZZNGUNSXcWfa/29YnVXyz3vbBJ1xKw9lqlWnZAYeRrrITP/9j9aFEpDlNoY3ZT
 TuIeBImaWenh/7VUcUtS2z25LVSm2blVcFLuIJS/iI/idLmaoB0n+T2RK/Z67PMoeMSI
 P4nQgDd9bt+5itnxAEi11I8ltazXexIwwRcEdyNfAxNHB9/5DIdT/17FOHldE5nenV4Y
 Ulag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4a80rrA4m79gFkPnjEk8AuHwLVgG2dijj6hS8YSip3Q=;
 b=5e9sD+tsEYF1upd0+NgxcN+HNJBVU3nOJT5Bh9t4+xQ7quM+D5GERpNFAxDQlv4BSE
 9JLt8hjJ/IBIcbDccA7sQWQ2oPLbIAjHYqZTizi/sjySuwjsC6VthLuKp1OoURYxgS3N
 NTGW5KfjxC++6xG7pL85fVvFkW7cV6fJfoet/+VvGJG90zEmqAvc1t9LIPO8wdB7925Y
 fzqDfKlg+6Ke3iiUvwZEbxFgOmIkxoQka+gSl1zIkwkGcbpAH4O66hM4R69XctQ4hQwT
 v10w8giJPLZTUbw36apzP9cOFVKJMJCzYPoL+4zPy4AITfxT3YcR85JQKYYo+1VsbdMk
 Qq3w==
X-Gm-Message-State: ACrzQf13kCYRYpu0rTJKnpl3S+x87lA5HbgSXA3JFrVxmZ+IoWoEkC9S
 5nVdpYw9u7lId1+OtIo52eSzVY7Fyy3typVOMDkRJw==
X-Google-Smtp-Source: AMsMyM7PaCG6ssJksz70KFzuK7tZUO9W21Cm47PIZ7yW9orf2nAhNv7ahBJ/YSUBM4glxp7Pw5Zhib8Q9Ut8KUjRJAk=
X-Received: by 2002:a17:907:75f2:b0:78d:49a6:5052 with SMTP id
 jz18-20020a17090775f200b0078d49a65052mr2099099ejc.680.1666095829314; Tue, 18
 Oct 2022 05:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-24-armbru@redhat.com>
 <752bcf6d-d37d-5605-d3bb-8e46c2e4b47c@linaro.org>
 <bdee0038-a29f-e517-0e12-be7a141f37b8@linux.ibm.com>
In-Reply-To: <bdee0038-a29f-e517-0e12-be7a141f37b8@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Tue, 18 Oct 2022 14:23:38 +0200
Message-ID: <CAPMQPEJvED3uYnJHcan7F8G-SdHEo+HTRb0sOx4CVJ-29m5gqw@mail.gmail.com>
Subject: Re: [PATCH v2 23/28] qapi tpm: Elide redundant has_FOO in generated C
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu-daude@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Oct 2022 at 14:12, Stefan Berger <stefanb@linux.ibm.com> wrote:
> On 10/18/22 08:01, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 18/10/22 08:28, Markus Armbruster wrote:
> >> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> >> They are also a nuisance to work with.  Recent commit "qapi: Start to
> >> elide redundant has_FOO in generated C" provided the means to elide
> >> them step by step.  This is the step for qapi/tpm.json.
> >>
> >> Said commit explains the transformation in more detail.  The invariant
> >> violations mentioned there do not occur here.
> >>
> >> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> >> ---
> >>   backends/tpm/tpm_passthrough.c | 2 --
> >>   monitor/hmp-cmds.c             | 8 ++++----
> >>   scripts/qapi/schema.py         | 1 -
> >>   3 files changed, 4 insertions(+), 7 deletions(-)
> >
> >> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> >> index 8f8bd93df1..378f5b083d 100644
> >> --- a/monitor/hmp-cmds.c
> >> +++ b/monitor/hmp-cmds.c
> >> @@ -885,10 +885,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdi=
ct)
> >>           case TPM_TYPE_PASSTHROUGH:
> >>               tpo =3D ti->options->u.passthrough.data;
> >>               monitor_printf(mon, "%s%s%s%s",
> >> -                           tpo->has_path ? ",path=3D" : "",
> >> -                           tpo->has_path ? tpo->path : "",
> >> -                           tpo->has_cancel_path ? ",cancel-path=3D" :=
 "",
> >> -                           tpo->has_cancel_path ? tpo->cancel_path : =
"");
> >> +                           tpo->path ? ",path=3D" : "",
> >> +                           tpo->path ?: "",
> >> +                           tpo->cancel_path ? ",cancel-path=3D" : "",
> >> +                           tpo->cancel_path ?: "");
> >
> > Or simply:
> >
> >              monitor_printf(mon, "%s%s",
> >                             tpo->path ? ",path=3D" : "",
> >                             tpo->cancel_path ? ",cancel-path=3D" : "");
> >
>
> this would never print any path...

I need more coffee... =3D) Trying to KISS:

    if (tpo->path) {
        monitor_printf(mon, ",path=3D%s", tpo->path);
    }
    if (tpo->cancel_path) {
        monitor_printf(mon, ",cancel-path=3D%s", tpo->cancel_path);
    }

