Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C2A642AA0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:46:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CjR-0006Gp-8G; Mon, 05 Dec 2022 09:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2CjN-0006GQ-SQ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:46:05 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2CjI-0001CT-Vm
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:46:05 -0500
Received: by mail-wm1-x329.google.com with SMTP id ay40so2186636wmb.2
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 06:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/YaTHzFZuGEklS/a9QjU4U6GJVgkGW+eJV/kbKg0rY=;
 b=jQgaEg6bSrFJhRQRx1bDwwN538Ceq6RvtILyHP9KteZpVt3QkLdA+LDmaD9GydG2ba
 PxIWNJ2vskgcW1J5NRZsuc2Mcy5RLf4NzmiaIV8mmyyrbGklPg+1VJA2v3gIVO0TNh5k
 /h9VXjSfYqBKm9WxUI47GqamrfMTL94Wiv1TbMBFTs4mnJwxJVBH4D0/tbaVqu7K0eBq
 sDbMiVjHNHuE3piebGHtMLhIzpeD6wMu58S1eSULujZCIvTFu13qiKcnaD4nxGjuwLOX
 lgVOiXVUbkDoonS0Cgx+9TzDyh9m2ZluVFZ61ipi8lzuJYNQP2+jrk8mzGjNKIZBUaqa
 gOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/YaTHzFZuGEklS/a9QjU4U6GJVgkGW+eJV/kbKg0rY=;
 b=QAlTglQVWk9JQ27OsnoF9fukIr8E2faNEv9/mzDu1sUV9b+rqIPZUCiRn6YvJixvDE
 a3RaQUNVTa6bfT1BgVpjEa7jycFQZo/JzMJzzG2QIcsLSC/9LES7JYgcODotRZiFYamu
 XoCtACTcpO36s5pMKVcRPPZB0681eKu5H+J7CziKF9hUXXICn9KAH2dD9OIBci80jYP/
 VH3wd+P5tXEJDURONpbDrIvydL3N9BxUdB25mZmV7GqNXn13+/O/2uYimkYRjKULo52d
 IKkSeuZ6QM9xM6ceRhqsQddRaV6tpyFrx4BffpfpXHSjs2CcTBgxK4KeAJzuECocUOQA
 haog==
X-Gm-Message-State: ANoB5pnUlRBZPpki+ry3vi3dREI9I5NJgV96ssRxmbABSG1vSvlvape5
 tlEnW3nquyvHUMHuIzg99Vw8MZGvJ+onNgcb5ihsuA==
X-Google-Smtp-Source: AA0mqf5IUlkE4WttakM5449TJ24ZRmaVcJI23pCUYAbeFo8E1jKfRF+vbISHK6QYfszX8fhwltl36Bi4awajvRgXE5c=
X-Received: by 2002:a05:600c:213:b0:3d0:869a:4e59 with SMTP id
 19-20020a05600c021300b003d0869a4e59mr10331247wmi.169.1670251558406; Mon, 05
 Dec 2022 06:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
 <20221127132112.300331-4-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221127132112.300331-4-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 14:45:44 +0000
Message-ID: <CAFEAcA-t6S3+ti4eZJHWJyxS_uGa664ib+T3Zny1MNvBQRyN+A@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] target/arm: Make stage_2_format for cache
 attributes optional
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Sun, 27 Nov 2022 at 13:21, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> The v8R PMSAv8 has a two-stage MPU translation process, but, unlike
> VMSAv8, the stage 2 attributes are in the same format as the stage 1
> attributes (8-bit MAIR format). Rather than converting the MAIR
> format to the format used for VMSA stage 2 (bits [5:2] of a VMSA
> stage 2 descriptor) and then converting back to do the attribute
> combination, allow combined_attrs_nofwb() to accept s2 attributes
> that are already in the MAIR format.
>
> We move the assert() to combined_attrs_fwb(), because that function
> really does require a VMSA stage 2 attribute format. (We will never
> get there for v8R, because PMSAv8 does not implement FEAT_S2FWB.)
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

