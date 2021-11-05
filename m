Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044544689B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:45:45 +0100 (CET)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj4Dg-0006bq-Fw
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj4BJ-0004Pf-3F
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:43:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj4BG-0007al-H9
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:43:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso10197171wmc.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QYcsYUdt9G0LZ+PSobWmWNul0KFwu4tgX+rb9Y0faaM=;
 b=SkVs79aoqm8WIjuRCFk+wu9K8L0nupfjF77of5DUN+9YwOUA1WiZLsp2oCkWo4lUw1
 Mi3JjzKVh1IpmUF2Mfl5zh2Ry4YCGasVHYifnq5xBqGKlH0i2WTszKRL26OWY0ghaAXJ
 bP+Tm//TKIX/JhC1txBKI8LLfiDl6qPe2Z4kcyYB0L1p5L13kVwARS38OGNN/LNH9YPE
 gduwk5oUY5ypIRdT18DVf1rkyX/qaaMMVXJg8caPFyYuIEUH22m7xIGDj8sO2WOp8zZH
 mkf3EhdYhJqwaAXEf9WQWP+NprLa2SYIv16Mko1R+jrMAAMNN0zO42yRVpPufr5Ywly7
 8CrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QYcsYUdt9G0LZ+PSobWmWNul0KFwu4tgX+rb9Y0faaM=;
 b=qIKuFrn1V87uPmeaBf1GGz6tqMGPc3F1Od3R9PpgzcETY3pi5/zhYYBHE1YN8eFapO
 FJzpqAJeKLD5LhuhBUXGTSVXXxTRs4kQTZdyxjXOBL/EFCUTw/R5GAosC8iu0a9jQ+gG
 lpbFpjU4Ag/kdHpKXkG2lEZCf9QznwXfhMcZhPSp4+FaJu0VpiYzgZUgzjAMlaXMqw+8
 IXv88s5FysGwpETjmIhSPBW0J1WI5HERX0rQ94HyM/w+HpymNQp8ImspTDh7p9QuLHhc
 xqZTA6QQdW56FhPAyy4N5vM5mLbtExA8ILX87rSq+hKy7kCvuY3CTNebO6gPWS9h0zmJ
 f7NQ==
X-Gm-Message-State: AOAM532/fZU0zgG4g7fk4sYPeNo36tZDeFH7mbaHMNNiywPr6rqXmVHP
 LL6AnoRFciSvuglEE/+gXrJnDki5MrG2FDddaqG1bthAMZE=
X-Google-Smtp-Source: ABdhPJxfy6MhiBCluRZjNPyAzLnn146sSS0u70nUDrtmW1SFYXeRjDVqjeeuxrqr4sSQhYQbWU8cBubWIQ0LLGKucZs=
X-Received: by 2002:a1c:a344:: with SMTP id m65mr31679197wme.32.1636137792864; 
 Fri, 05 Nov 2021 11:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211105165254.3544369-1-laurent@vivier.eu>
 <CAFEAcA_ma2f6UfMSSJwssVjdZHQzO2LQfK2KROfv11Mec0WWsg@mail.gmail.com>
 <3f1bcc4e-2b53-8f54-e927-d52aef76a9c6@vivier.eu>
In-Reply-To: <3f1bcc4e-2b53-8f54-e927-d52aef76a9c6@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 18:43:01 +0000
Message-ID: <CAFEAcA-Yz0ww_1C22X-DmCsN7t=1URrt4p6SL2UHHMhRPomDkQ@mail.gmail.com>
Subject: Re: [PATCH] macfb: fix a memory leak (CID 1465231)
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Nov 2021 at 18:32, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 05/11/2021 =C3=A0 18:01, Peter Maydell a =C3=A9crit :
> > On Fri, 5 Nov 2021 at 16:52, Laurent Vivier <laurent@vivier.eu> wrote:
> >>
> >> Rewrite the function using g_string_append_printf() rather than
> >> g_strdup_printf()/g_strconcat().
> >>
> >> Fixes: df8abbbadf74 ("macfb: add common monitor modes supported by the=
 MacOS toolbox ROM")
> >> Cc: mark.cave-ayland@ilande.co.uk
> >> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> >> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> >> ---
> >>   hw/display/macfb.c | 11 ++++-------
> >>   1 file changed, 4 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> >> index 4b352eb89c3f..277d3e663331 100644
> >> --- a/hw/display/macfb.c
> >> +++ b/hw/display/macfb.c
> >> @@ -440,21 +440,18 @@ static MacFbMode *macfb_find_mode(MacfbDisplayTy=
pe display_type,
> >>
> >>   static gchar *macfb_mode_list(void)
> >>   {
> >> -    gchar *list =3D NULL;
> >> -    gchar *mode;
> >> +    GString *list =3D g_string_new("");
> >>       MacFbMode *macfb_mode;
> >>       int i;
> >>
> >>       for (i =3D 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
> >>           macfb_mode =3D &macfb_mode_table[i];
> >>
> >> -        mode =3D g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
> >> +        g_string_append_printf(list, "    %dx%dx%d\n", macfb_mode->wi=
dth,
> >>                                  macfb_mode->height, macfb_mode->depth=
);
> >> -        list =3D g_strconcat(mode, list, NULL);
> >> -        g_free(mode);
> >>       }
> >>
> >> -    return list;
> >> +    return g_string_free(list, FALSE);
> >
> > This reverses the order compared to the old code (which prepends
> > 'mode' to the 'list' string it is building up). Does that matter ?
> >
>
> Not at all. Perhaps it's even better like that as we have lower resolutio=
ns first.

In that case,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

