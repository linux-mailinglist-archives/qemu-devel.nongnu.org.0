Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB3E177E62
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 19:20:16 +0100 (CET)
Received: from localhost ([::1]:51492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9C9P-0005wi-FB
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 13:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j9C8d-0005N3-P4
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:19:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j9C8c-0003jd-M7
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:19:27 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j9C8c-0003jQ-Fd
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:19:26 -0500
Received: by mail-wr1-x441.google.com with SMTP id q8so5657595wrm.4
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 10:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Mkbht4X0I2KreZwSzvHHKipVI2lR5RsP/3wT+MYXZJQ=;
 b=Yd377yrKlGFQ1JixehfXs6jEiytpCznhGyhQdFt8fEhwgWk2w4dGRHGfaR75tLUV4H
 3msz1qkOBv7+Zt2FaO1RFM0EzRjat8T/PbaSvW7TeDa1aFeJG7vIHJIoDAZfi8c+uwp8
 bUZrrqfJwFEB9WXnGkygB2sEMvUHystLbWjayJ1QRA0hUVnQooDGaG4tKQqVvajbAqo0
 R7qGygOfkB2YuZG+zE6e0uB9bpFI6sPzO8BgLxIwN/Pi5lkWkrYjS3qrCUwQ57n7vzp+
 i+1hL9JuqXMVKNgk3msE+lCxGG90TlaAVwFBEyT9Nr+2PqVP9ZHdt63fU5rhox0mfMRH
 Yitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Mkbht4X0I2KreZwSzvHHKipVI2lR5RsP/3wT+MYXZJQ=;
 b=AxNGq3lHnpfRwDqtitxlQmDCoXk3B/mPxjp4Pch+p534CNmDry/MMFPKtT2X09Emky
 aXXajiBZ/9czjZgTgDA1g/4krnlPBFcjiFspGXNhhB+BGUSlkWgDlUQY6sTC3q1yCnQ7
 NEJNj3HxfmY3swXR4EBWY38fattl5K5cVNn/UaH6eg0rMEziFKlF+/MuksHASvDJiVZj
 HvBqrtLuRm0qSGwJ0WhXQnFLKRXuDknTodi4cI1i1kbWE1ZLJCkxpFKAE/PVQwdnykpM
 iSYv6CSw2qMXrVUb1qdpOGn4IabEViqqIc//2xHt2n1YD+yI3koTi4LY8T1YYeqFyKfW
 x4sw==
X-Gm-Message-State: ANhLgQ2p2P01sHEEcgq9lkuQkWcuGmo5SD+h2baHGP1oNLWkF2bMcX7o
 27VC95B4S/sP18es1l6M03c/Ug==
X-Google-Smtp-Source: ADFU+vsodv+nT2yqaAOg2+WiqrgNX842XteZ9JTaAQYEB6ax4UdbwHdJenAyaEnoScpvznvpf3TWlw==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr6737684wrr.352.1583259564787; 
 Tue, 03 Mar 2020 10:19:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h17sm36191813wro.52.2020.03.03.10.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 10:19:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B1E9F1FF87;
 Tue,  3 Mar 2020 18:19:22 +0000 (GMT)
References: <20200228153619.9906-1-peter.maydell@linaro.org>
 <CAFEAcA8vbqA_4K7dkyOrU_8HDrRo8h5eYESLgNnOzvrp0tVUpQ@mail.gmail.com>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 00/33] Convert qemu-doc to rST
In-reply-to: <CAFEAcA8vbqA_4K7dkyOrU_8HDrRo8h5eYESLgNnOzvrp0tVUpQ@mail.gmail.com>
Date: Tue, 03 Mar 2020 18:19:22 +0000
Message-ID: <874kv5713p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 28 Feb 2020 at 15:36, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> Hi; this series does a complete conversion of qemu-doc from
>> Texinfo to rST, including the hxtool-generated parts and
>> creation of the qemu.1 manpage from rST.
>>
>
> Advance notice: I would like to put these into a pull
> request at the end of this week. This is your opportunity
> to say "that would be a bad idea", "I need X more time
> to review it", etc :-)

Just merge it, we can fix things up afterwards if we need to but it's a
big step in the right direction.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

