Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C746168DEF8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:32:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRp7-0007Qg-NY; Tue, 07 Feb 2023 12:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRp3-0007P7-Q9
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:32:02 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRp2-0002uh-59
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:32:01 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 d6-20020a17090ae28600b00230aa72904fso7420331pjz.5
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vRTybcxBsAP89kvmk09OUcwi8QDWUzvMiYP/gKHeZIU=;
 b=kAI/RvcIcubRQ9j38NLA8TlHhhyi+Y0x3hAGeK3lYAsXCJibemXrgOl+TJ1u0mGXZf
 q16pqLmUxgJN6MuwjNM9DKX5EYU1jy/sdTL+O20ZF+mng6iHDhxRwKB8E/6G1KG3i3YJ
 k7dSDRbozZ526sfKr2K5rC/F1S+2IthIQ/W2qlJFws3GguYzm5lTQrvg8mzXTkzc8GRY
 r2ZsakTZOI7dr2Bw0eKvAQzZznZj3LWPA/9LXycsy7ONn4JDlZlp3mx1+F8ZBnrwxOI8
 +ksq/XJ7Ou6B5tVjGZ7FQtTyOYB/mw04/dgYpaICZ7AiH+aGM4vCh/grT3lodbU11wWr
 dlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vRTybcxBsAP89kvmk09OUcwi8QDWUzvMiYP/gKHeZIU=;
 b=X9In2VHNQYS84g58TCkv5pCQ2csSQV1UUEPpUFp3DJNTOFccELUlIREC6a9M3UByms
 Y1QecUc0kyX6RzLYMeYReRo4+GCCQudZSOBEXFAbsP1STD5WXZL0RSYSXNMRzASAZDuh
 yqp/n2UgjDxG7lOdBBundHMvfMJwWPii1nzbDi9lwNLByQpz/ciO54jA1loY9n5PPDjS
 CWyYwlh8eXy7eqOG3xFiV2xvIJBCrf1JhvMsY5yDpETmXBcufFezSPtwfP5zByX0BHl2
 0nPNoOl5b/aa8WLE8Smx15xtt6zR+2K9vRZEVL5ilLYqqW67RNnd/sJ6A2DeoSB4aMG1
 UuQA==
X-Gm-Message-State: AO0yUKV0w8UbfSPrOWfjSyGwtlLpR+EFyODdt/t79zFxEPhY1jZQ+4pI
 tB1mg8XN5qP4mnaZAiYif4JryM5g8sC8zdhVPEeemA==
X-Google-Smtp-Source: AK7set+ljm3Na2SfqD7oIuaDQJ+2OlaxKXlX+wow7EPo120RRVrYwYOUcKXjjmWSqkINnl/eA18BanpQQb/qFTLsmTo=
X-Received: by 2002:a17:90a:fe08:b0:231:a31:e8ed with SMTP id
 ck8-20020a17090afe0800b002310a31e8edmr11307pjb.89.1675791118703; Tue, 07 Feb
 2023 09:31:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <b9ce7922d0b226065e1d1eeed2e37759c9bd7e30.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <b9ce7922d0b226065e1d1eeed2e37759c9bd7e30.1675193329.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:31:47 +0000
Message-ID: <CAFEAcA-ZP4sBdUjUY8s4a+tUweNMKLywkFpuJh4VFVUb-0jkzw@mail.gmail.com>
Subject: Re: [PATCH 4/6] usb/ohci: Move a function next to where it is used
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 31 Jan 2023 at 19:39, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> The ohci_port_set_if_connected() function is only used by
> ohci_port_set_status(), move next to it to have them at the same place.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/hcd-ohci.c | 60 +++++++++++++++++++++++------------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

