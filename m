Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A798307A87
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:20:12 +0100 (CET)
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A1j-0002HL-BI
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A0C-0001Zp-GQ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:18:36 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A0A-0002wO-Qv
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:18:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id 6so5994678wri.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=tl/82vep/H9zVUPdXMz0yoRl65O/anK7hG2mGkrZqSRkBluGv1bjAcOMgdF/LGBpi0
 qObtclf9sL7yKK+FgOml4Kc1m2pdGqII6P511KPQYfu95HYykgxtM6+rTJnNdRbuTjD0
 qIzupp5MiYygx0AStSHAFsT1WCluByyHgd+VG7TI+xHQaPQrQbfEE5OcrGfYFakAI5rd
 c+/52tqd4fjzwfEhSS3a7ssy3L+XjsocYbfv3AO2go/TP14dLEzVRwg1Y1yjtZNyKa0t
 Eu0qqqutWPBKN+PLd9pylFm1saH3fLkMgaf5tz2EWfpMVqBiz1jxGKZ44EcROYHLmppl
 GySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=Tj2eNlCAEbSqpk44sV2Mg/5AD2mt3UHjqpeFsn3XyWcIIWP6EIKEC0bM+Q+2Zpa9Jr
 FoStcUyTuCaOj9kvxK1YDtGZFhOyHxGGwpK+HPY+TGH8Na6oFD9ayD0z53w92N451glu
 ci15sUeVTIIvV+1WzcWx6kY0UEs4WBgqm/KnPsqimDkDuur9RhYic5s6PlX7h9GcxpJT
 dz3dVmc+BomI+erZVaaRUP6S0uKPSs6aNISXMiZV/L7vsrmWgKCUFoPVCwo5AHa1B26g
 1jR7MU2vQb6hCfEbBVue6d2J5FGlhY0664Uo1TNTuVOuHiyYxlcQGgbN20rVhgGvbprN
 lFaQ==
X-Gm-Message-State: AOAM531my8lUWfje/InPCp7eYvo6huZmmSDgVPP4QVG25PTM7noSsFHT
 1y1+1nNPbr8c1z1hvd/CvxI8dQ==
X-Google-Smtp-Source: ABdhPJyp579zRIBAUdPl1guqKmvO7wtQNAuVCB94Nim6obOta1f8WT62rsYetHKdGUOYWtNx9118BA==
X-Received: by 2002:a5d:6509:: with SMTP id x9mr17400078wru.229.1611850712908; 
 Thu, 28 Jan 2021 08:18:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n16sm7121755wrj.26.2021.01.28.08.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:18:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C802A1FF7E;
 Thu, 28 Jan 2021 16:18:30 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 11/23] tcg/tci: Merge INDEX_op_ld8u_{i32,i64}
Date: Thu, 28 Jan 2021 16:18:26 +0000
In-reply-to: <20210128082331.196801-12-richard.henderson@linaro.org>
Message-ID: <875z3hujah.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

