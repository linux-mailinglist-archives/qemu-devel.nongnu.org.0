Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41500322748
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:56:47 +0100 (CET)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETUs-0000ky-AO
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lETTN-0008Hg-Q5
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:55:15 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lETTH-000435-OQ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:55:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id h98so16908889wrh.11
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 00:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0PGqkRzqgsKov7tE7ehBeYyKrBcfjMW0q+js0mack1g=;
 b=WBmzZh9JAtFtoON/PafBdIe2ScNbkJ0TnZmNduarEiwjXPwLAMlpU6J0vwtpcQUg4X
 FSvocYUXQtFp2cB/qYa6k7S1YTCo7V1/Z/AVYEn6RShbuqwrw6O8m69MT2fMmI5IAMh6
 t2TtxnBlkxbUmDDiLrT6xU1eZlaH6vUlanpw7DUk/MFnl1WQKRG6z6/31dM/w52GwyVH
 XlKrOvBLA2vA2Yar5F+XCdf9+jhtoBdIRfI4hoU2lZLGPilYOoDomhmCn9PLKEcHD4fK
 nDIscN+ONxZyPDR/neJ/F4bX/Pc4ilOWpVFvjkVpSYcepBcuWVX24MiYA6mqfK+96WbG
 EyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0PGqkRzqgsKov7tE7ehBeYyKrBcfjMW0q+js0mack1g=;
 b=M+2qbYA/hxm+SgO+PpuVRUbdm/Xs1LTZBWkzg2DgFOnYmllLX/XMGGJ+yzzQZWXhkN
 cOl8riMiGglhp4U2XLW0N3iKJiEaUvGRAbBN4yhd1OiKNbpxnPhiYmvNWGK6iY299DsF
 18vyjoUdDujBmAbdK65+QIago2uHr5AI2ofWm7UZqzlb+qB0rQKhEWPf7Y/1HD2ZAEej
 dbDPz2cJqC2wk8U4zmWSOmM9zn8+09PrMX+VktZsQtng1yk8rQxs4lhaHNTbslHI1gLW
 XteHVVtwsbIRv+mustikeaJXX7CTWdrLlqvCKvmu22hmnNqhTjz13l56n3aPO6SB37af
 dbzQ==
X-Gm-Message-State: AOAM532unjxMvFiA+kY/h3B+FcBsg2tXuI5ysEojyfo2IJU1vtsQ6gOa
 TawG1psN5TbO+F2whvk5+TMaLw==
X-Google-Smtp-Source: ABdhPJw0+Jn2UsbkuMz88sQlKR9Il5O6Z0g9u4Yu++xubLIbTBzWudWULgxecQeyMq70CbryJxecLQ==
X-Received: by 2002:a05:6000:10c5:: with SMTP id
 b5mr25677871wrx.284.1614070504823; 
 Tue, 23 Feb 2021 00:55:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d29sm25338326wra.51.2021.02.23.00.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 00:55:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 192881FF7E;
 Tue, 23 Feb 2021 08:55:03 +0000 (GMT)
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org>
 <CAFEAcA81B_7+aEu3CkOwRGdaEtP8r_HwihuD+oEwYsb4+ZmSUA@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
Date: Tue, 23 Feb 2021 08:52:45 +0000
In-reply-to: <CAFEAcA81B_7+aEu3CkOwRGdaEtP8r_HwihuD+oEwYsb4+ZmSUA@mail.gmail.com>
Message-ID: <87zgzv4108.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
 "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 22 Feb 2021 at 19:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> It certainly is by design. The comment for the helper states:
>>
>>   /*
>>    * The following additional queries can be run on the hwaddr structure
>>    * to return information about it. For non-IO accesses the device
>>    * offset will be into the appropriate block of RAM.
>>    */
>
> That sounds like we're exposing ram_addrs to the plugin. Are we?
> I'm not sure that's a good idea, as they're not a guest-relevant
> construct.

We currently expose qemu_ram_addr_from_host for RAM blocks. Are you
saying we should translate that to the direct physical address mapping?
If we do that for RAM should we be doing the same for IO addresses?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

