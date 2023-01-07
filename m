Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B55660E27
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 12:00:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE6uX-0004jQ-LI; Sat, 07 Jan 2023 05:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pE6uR-0004jB-3k
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 05:58:43 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pE6uP-0002uq-98
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 05:58:42 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ud5so8882802ejc.4
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 02:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojbJNP36CvrRWo22zSn32zK2y/pXsV+Mmkw5xGIK2Pg=;
 b=hEtdA4nME3eNcpjNgQ3F3dCNDNRy3K91tNQWFFKz8eYVdhYNamrTCdnub5/2uK22E+
 otuEYgoHszVpnjT9ZZToFJ8dMPn51ocD2GU6W1XXPFU8K1W7fdCPCVQfr5x49H1hccF5
 Zpi7ZlFeLP38+URxOL0BU6WLqVOb3aoNbhZnQLJYmldB8fDj8Uaz+0Pd2ApDbvpHbkqE
 3k4WJogU4GwnqqrjLd2PO98f2IJw9TdGJaUWtJEQykq7lt3ujr4QNbgZ70Rn+cyqeji4
 o/eX4vLZShAc+aj/A2DxCCcQIka9T3jPGFmN6I7Q9cwgwDhjA48MfPZbdF0CvnneLS8r
 H3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ojbJNP36CvrRWo22zSn32zK2y/pXsV+Mmkw5xGIK2Pg=;
 b=kxxpZdTMYeW92ScosVxUG9NWlcU+pb7UAyfpFqx90TDaeP4rTd5eUOsXz34Vpd+fiy
 rdJSD+gFM2uZAWePiZMe2Cp/roskvxw+Cs/Q/PE40iWZI1qXTOg+WGUh9Z6ougFNl+w/
 Q9bAbgUOf4fGSqWsTcggykUoM/fnkv9E2l7Qt9XzJAE5Gbm6ZhXSI8YuiXt6J+leaim3
 /yoMLbShdvovlFzABRvCGdW6r21fyz9ZUV7fHnhfjHKa5iXuU3B4IHQD8JOVClt9J/m5
 Z97gkvbS15AVzC9JL8InB2KNcIiGSXhrmGwr3Z4H9Oy15RqInQHoPSQjF024J7Ztcw8P
 hHUQ==
X-Gm-Message-State: AFqh2koaZ/r65AKbm8d6XsBPj8mb01zwC8SVcUlu1/2cvoOpXj7NgpEs
 RV/zUAa0ogUb9k/Lb8Fe6A4=
X-Google-Smtp-Source: AMrXdXuVhiLxEGrharK3dUjrwBfNTxBrdm5SiG2nGWJW4zBv8CB5mvtoicCvREcZjQt+b9feh78vcw==
X-Received: by 2002:a17:906:4a0c:b0:7c1:3018:73b6 with SMTP id
 w12-20020a1709064a0c00b007c1301873b6mr49497559eju.61.1673089119432; 
 Sat, 07 Jan 2023 02:58:39 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200f901f42a62c21174.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:f901:f42a:62c2:1174])
 by smtp.gmail.com with ESMTPSA id
 gc22-20020a1709072b1600b007c127e1511dsm1312119ejc.220.2023.01.07.02.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 02:58:39 -0800 (PST)
Date: Sat, 07 Jan 2023 10:58:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/6=5D_hw/isa/piix=3A_Wire_u?=
 =?US-ASCII?Q?p_Xen_PCI_IRQ_handling_outside_of_PIIX3?=
In-Reply-To: <b80c0bb26d8539899f53b91deb48f748e2495d23.camel@infradead.org>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-4-shentey@gmail.com>
 <b80c0bb26d8539899f53b91deb48f748e2495d23.camel@infradead.org>
Message-ID: <B71743F3-1C6A-4A18-A9A2-AEB252BE25CE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 6=2E Januar 2023 17:35:18 UTC schrieb David Woodhouse <dwmw2@infradead=
=2Eorg>:
>On Wed, 2023-01-04 at 15:44 +0100, Bernhard Beschow wrote:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (xen_enabled()) {
>
>Could this perhaps be if (xen_mode !=3D XEN_DISABLED) once we merge the
>Xen-on-KVM series?

It's the same condition which selected TYPE_PIIX3_XEN_DEVICE until the las=
t patch of this series=2E If you had to change this condition in your serie=
s then just perform the same change here instead=2E

Best regards,
Bernhard

