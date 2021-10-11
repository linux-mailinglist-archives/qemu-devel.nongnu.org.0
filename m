Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0997C428A44
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:00:17 +0200 (CEST)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZs6S-0000Af-2G
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZs2G-0005GD-0H
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:55:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZs2A-0007o3-Sc
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:55:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id r10so54305922wra.12
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=EpEBCbGAnre5+zEgXguVIiAdHCTZsfpB08Qdn+eynsU=;
 b=sgNAnzEy/e/Hkkkg+UZF969PzjoEMBE5XvpbSEe9uQR/ucFRHEo1I5qclAU8RhhffK
 OZguf4wlv06QCzgB4Fm1wgjqZoGHYhN9X45L4Gvn9SIk2MRh2whQPfZdRZ5Me9lHwVkj
 p8jtUvJZT35U3FPNi8oGW2K5S6z9uUJyMppXZBomDYvv1RUl1vidyvD+bU6wIoi7udZK
 lFI79UXzQ16D3CcjiK9b5iWTSVNr1xzkhYpv6rMUWlN8edYSnOGWs6Y8AjJizbksG9tl
 /LzHmRydkl/wGqEQWCetp1e7yiz9PztrLgUXiT48TEaQ9olkPU2NXfH3mE5R8AFVBa7e
 bcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=EpEBCbGAnre5+zEgXguVIiAdHCTZsfpB08Qdn+eynsU=;
 b=lytKWnSYS6lXjFA58K8bpyuQy/OdkGwhPRM5sSJhYOkvDd8oTRao83f/+lc3su0cTs
 7UrM6gYjz2kQ1yIP70SGrKVSvKgAJ/p0srfszG29naH02VSdAUnD740UOLCx7V/xkLq9
 Tik/B+gUezauk67bEvUHr+2BU+eVKCv91jmqhAu0H/U/K+41yLkep8d2YYvEdp1ssn7x
 uj9slGf5iZIR+3H6BRTbUIGq1l7bZ5HYHSh6aWV0NJk9DMXG2WzNxXYtG3PJ/ivJYeFv
 +yoxzzXxi5rsesiFPiLc4uBRi4MvX7E03xkAihv+BOLZTdaYKW3UwMYI/v8i2//dHvwu
 t9bA==
X-Gm-Message-State: AOAM533mDKFbNNYTCSbu+8DwOeYj34z8PMqWGPHABFRB+T33p/93nekV
 X6uYmbmFtuoClY8HvYoP9ig1Ew==
X-Google-Smtp-Source: ABdhPJwpb8PxM7Z0PUnlvnODwa2Rtbx7gfrNYvC9wh1MGPcJgNA03Ob0YLtMvzewSHeRiqhFakZFqQ==
X-Received: by 2002:adf:9bc9:: with SMTP id e9mr23483225wrc.388.1633946148867; 
 Mon, 11 Oct 2021 02:55:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z2sm6392460wrh.44.2021.10.11.02.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 02:55:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19A2C1FF96;
 Mon, 11 Oct 2021 10:55:47 +0100 (BST)
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/8] tcg: Add TCG_TARGET_SIGNED_ADDR32
Date: Mon, 11 Oct 2021 10:55:41 +0100
In-reply-to: <20211010174401.141339-2-richard.henderson@linaro.org>
Message-ID: <87k0ijyjfh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Define as 0 for all tcg hosts.  Put this in a separate header,
> because we'll want this in places that do not ordinarily have
> access to all of tcg/tcg.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

