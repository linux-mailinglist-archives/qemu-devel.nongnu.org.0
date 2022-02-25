Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457DE4C4645
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:26:57 +0100 (CET)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNacR-0004Du-Jx
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:26:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNa6y-0001Cl-R6
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:54:21 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=41596
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNa6u-0000JS-S0
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:54:16 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id j12so5675125ybh.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F+BvtSXN1W26AjBOOLKCxf/PhOdV8Uu9GIiihSnY1ac=;
 b=Kx0DnTkLn+dlURRzrksWflPGLMDTxMAXaEg0QRrhDZ9kEBEjIdzzS5J9xTpUxd82q1
 cS7Cga9swy2vY7Mhd+YA4sKtsDGp43LEvPyGV9P4T0uQyaziBQNwNPw/L+hvDoUaB0UE
 Ki+ZsdTfwcEtbF0L5f0rxv/JC+pM7MEY5niN4jVMa+5NGqBCFjIj2UmfNJpLL4f2YICR
 2tHdF1M0mFIugdSb7yywlE7CbjLiq8246uz+5qDDAB5opw4QtgmKnRlfY71xY83FUICd
 qe7LYEowMVpZfm/OxP3V8I8yhhQueemIshi+2mh8+XXFRngfFVXq66zn7zkiYKohxZqV
 kPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F+BvtSXN1W26AjBOOLKCxf/PhOdV8Uu9GIiihSnY1ac=;
 b=50LUqNJW0WSOxr+wzW2ARiRKgkHhMoOHDpn1eTRfftb6UkYbqYuN5Qg5ohpsbEvEGx
 hcd3I7CjuyNldZ6tK3ZjwQgSCLXW9vkYaakLA/jQMPS7ZCN6T2MAbQ3BjDKpDEcvqP9p
 4ZW0KRPeXB0R/lqdP68qCHIXkFQoBU+ZHy6WPOKnYdX1M9l0n4VrN2DD6sS/ykbgjYT0
 COF/W8s1HOp2nheUOUMGHZe3+gsQOXAGSzhPLX6nUe8I7CeXTwGdxTe7Q5W3z6gOw+5h
 t0wz252+VmI+OQjNOd29/Ew+b0uBNdGVQ7L5JPoqGIm6Kc1G+LIBq320ZcA0O/LxtynI
 CqOw==
X-Gm-Message-State: AOAM530lQNhqA507U1pnbyT+ra7unyp+tysI+oFPP/RawRJlX1NDTutm
 V4flWNzo8PWFUBobGozuOCDhArn6c+gKOhy+w8/Mug==
X-Google-Smtp-Source: ABdhPJyQ4FMCSxnzXCIqLqw55XqySVP4zJA8uJ8iWfW+VjbR9nlOCjSRt+tG7e+9f5moI1Y1/6jHjO0LiMXfgmy9sFk=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr7165077ybb.288.1645793651472; Fri, 25
 Feb 2022 04:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-14-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-14-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 12:53:58 +0000
Message-ID: <CAFEAcA8-01brqet4D8=KtBmcdQ_jPT9dSa2ExcFAjF+252Dztg@mail.gmail.com>
Subject: Re: [PATCH v5 13/16] ui/cocoa: Add Services menu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 18:58, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> From: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Services menu functionality of Cocoa is described at:
> https://developer.apple.com/design/human-interface-guidelines/macos/exten=
sions/services/
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20220214091320.51750-1-akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

