Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBD177523
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 12:11:56 +0100 (CET)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j95St-00088h-8g
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 06:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j95Rl-0007ad-9e
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 06:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j95Ri-0005GY-VO
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 06:10:44 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j95Rh-0005Fg-8y
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 06:10:42 -0500
Received: by mail-wr1-x443.google.com with SMTP id z15so3837794wrl.1
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 03:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=H2sjARtbLyE3d5VSioxD/lkrcF5xZfEHutShtGfY4HQ=;
 b=NFeViVsJcOAGWzfHUYxtPU145qBooPQQGmf9m1/Y8JLRhP0aincJX7iJcwhhzXOA+h
 2utB8AsyLK8ftkn/fi1gafF/fy1kZLd24ntMttLBLhU2C5KHLut5WeMbYukAN5W4smTw
 KxlDfUIJsS0sldCkPTNTqw6WEXrfry20apMIZTybdZqIbXO9KkLfmvn3AlJ6kVHzizQz
 /vaty5i+0hT541WjwDrTHMqFkT7JKnj/GDpZ76ZZ433zOFTNmjiaVxIed9ugKRzN9HE1
 dVgfa65u8Ox881xKWNV41wh496HrpgrlmRREOwLZuoH1zI2seRGodsgsDaJ3vJIHZ1Hk
 F2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=H2sjARtbLyE3d5VSioxD/lkrcF5xZfEHutShtGfY4HQ=;
 b=V1Aacd2lGkQrQstuxqWSgfw1nJ+XngTymd5RQmpvN1sJe3d4Hgtucjlj328sYN4juk
 cwasBjqnXM//PMRQwTCIzTp5mN0uBiBQ0jcjABCF7wriUJYSmGVUXKZ4BBvpJmkQuZd/
 z0HuvB6RacYWPIINHvOUTxmc18s2kxJlJ7XCUfe+vwbOKZdV4ecPalFauHF5FAOE10Mf
 BfLzPYX5YK7/ZVhQG2R9oUGeSOA84OVP7e/QFk/h7yaxZKVoyYBiqwNNl2YFL6tD4F1o
 0EwmcMe9WkYr5aMJb9Bx71zfH2S2lQSYkWA2sfSdsbV4LSaEpu/QShZRneMLTKTyaYd+
 7aKQ==
X-Gm-Message-State: ANhLgQ3L+p2jRa7H6MHxCHIEhJWwDIUobj0B7NX8MJd6FIMyvZ8pPxfJ
 5JyMPGLP2vd3GwKGei7DblgMIA==
X-Google-Smtp-Source: ADFU+vssac3vdGlEOL+CGbtdj1/vq+erMbUc6IQ2mvkn3I1AFZxk2h8+BRi5vuQYidcN4syuTfVVIg==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr4889976wrv.318.1583233839961; 
 Tue, 03 Mar 2020 03:10:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l17sm3657014wmi.10.2020.03.03.03.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 03:10:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DE0E1FF87;
 Tue,  3 Mar 2020 11:10:38 +0000 (GMT)
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-4-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [PATCH v6 03/18] hw/arm/allwinner-h3: add Clock Control Unit
In-reply-to: <20200301215029.15196-4-nieklinnenbank@gmail.com>
Date: Tue, 03 Mar 2020 11:10:38 +0000
Message-ID: <87pndt7ky9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: peter.maydell@linaro.org, jasowang@redhat.com, qemu-devel@nongnu.org,
 b.galvani@gmail.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> The Clock Control Unit is responsible for clock signal generation,
> configuration and distribution in the Allwinner H3 System on Chip.
> This commit adds support for the Clock Control Unit which emulates
> a simple read/write register interface.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

