Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD46DC746
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 15:29:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plrZn-0004Ox-1a; Mon, 10 Apr 2023 09:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plrZH-0004Lv-K1
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:28:24 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plrZF-00070L-EJ
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:28:23 -0400
Received: by mail-ej1-x629.google.com with SMTP id sg7so23887514ejc.9
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681133300; x=1683725300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KL7qKIrzETF0DLj0SN/RDsYoN4Wj6iKIwkYCIbr6ZcQ=;
 b=lhp9UGTxa2ORcnNC7JqKZOm/IYn3QujVhz/4cOg+RDl7gt8iuEueWTpXxo5m2lO4ni
 gGFQh+QfrZ9nQNc6ulPUQz5Q7fIohjd+4zs3ZoLnPPgDGOpDGnk0DnVPmhwxY1WnYRNG
 OvArHzjjOcHnZxr2FTEwJhEUearmKSHUsfkwr1L9+ujQtHj9TEcQ2WnIrHF6Gc47ggEQ
 TB1872mN/dI4SiT+xpNOIXNZMZ6mTV52hu0Ls3OjAV4dB20wD6qyU64do3zQQfcH7pbG
 WgJxVOtTXt4TEt2DnfbNaIcOekxijg6ZRkY0WO9RwG3KQY+bsXLnrX4n0Q1Yl/T+fAM9
 9HgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681133300; x=1683725300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KL7qKIrzETF0DLj0SN/RDsYoN4Wj6iKIwkYCIbr6ZcQ=;
 b=3lW8IpSxEhxCOue0YbySA/lO5lCr/ZLjIdbe8SVSNI8CY1AB+v67DcojmNFKF4WBX3
 N1iWVrpNplpFy+dJFAYkI/JcLNOBHxQs3Gn8vqAIF9DlV1DIQNwH+QwCPP6rX1crUoch
 5q+3HDyfx5FAsM9kl8qHSmgcduhbGkcJHve6GaFtZVIRIxqEE2c/vRLVhiNMxvoc+iXu
 WIjZsGDU2u54O4AgPgGXkTfCdTO5e/1Fjbo1pOix9aNSwU2tfwBpTxOkiax0W3gr8Lgh
 QKE028aSjmSVbgL542YSjAbFu7UOYhRBbMYa5UPQx/qMR7Z8UPtGqEtWTB/1cO4+Yy5U
 NXhw==
X-Gm-Message-State: AAQBX9d/QYawCp+U8lv0McHa8+bfHOMajApaWROJiapm8a/ekMbhxvOR
 T0q3vQDLphO6gAbq0Uu4za+h6VoTGWAA+ODgemCAMg==
X-Google-Smtp-Source: AKy350b3/+QjRIF1S/rG9VRevfVFopGND/Qrf+R+zjAdLcNAu9tbpwWzB57IMb4nEBdJzK9Hk/kGjC68yVND+7JeLFY=
X-Received: by 2002:a17:906:730b:b0:939:a51a:dc30 with SMTP id
 di11-20020a170906730b00b00939a51adc30mr4210759ejc.2.1681133300071; Mon, 10
 Apr 2023 06:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230409212347.16028-1-clg@kaod.org>
In-Reply-To: <20230409212347.16028-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Apr 2023 14:28:09 +0100
Message-ID: <CAFEAcA8M1dOgDkn0JfWPmDue7Kzn1oKyXXHHsUW8-v2YwbJa+g@mail.gmail.com>
Subject: Re: [PULL 0/1] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Sun, 9 Apr 2023 at 22:23, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit c6f3cbca32bde9ee94d9949aa63e8a7ef2d7bc=
5b:
>
>   Update version for v8.0.0-rc3 release (2023-04-05 17:26:14 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20230409
>
> for you to fetch changes up to a253231fbede6e69bf287afd90f67347a7383aab:
>
>   target/ppc: Fix temp usage in gen_op_arith_modw (2023-04-09 19:21:27 +0=
200)
>
> ----------------------------------------------------------------
> ppc queue:
>
> * Fix regresion with prefix instructions and pcrel addressing


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

