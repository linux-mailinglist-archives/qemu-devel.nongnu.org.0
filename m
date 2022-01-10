Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD7748A360
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:06:40 +0100 (CET)
Received: from localhost ([::1]:42580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73kM-0006vp-NM
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:06:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n73hi-0005Sb-Fz
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:03:54 -0500
Received: from [2a00:1450:4864:20::530] (port=40799
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n73hh-0004eN-31
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:03:54 -0500
Received: by mail-ed1-x530.google.com with SMTP id a18so58836639edj.7
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 15:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3K025mc744fwwg/JYRmYHCRp+jrks2XJXschLXeJe2I=;
 b=jj802Li9hEvaVUnw9kyYUO7FCFTqUsbiR93YeirujaW/ABMGjOxLB2zTW+8hCJo6EM
 DXx0LmUBpeX+N0XGlcdhyBPmTvwlsbJWUPzNVpYRFOKKMNgJ/Xcz+U8ItZh19LiTTEz5
 5KnGAto2S8XP4CmMU8rt0ZDE37MviKx/cYWMfI5mrxk00rHAVq3MCIjgcibzNiPxNBIn
 Ig5rpWJEbqUlQQKOHbbH7OiLdqb4LIKRVqZF/vbnS2yl1ZSV1mwmt8ObHCpgXgQLWNZ2
 ZwkSVcTj2tYMCAhaLGe8RigR/+aA7KcfnmQO8InVETqRsx+/7jUwDE51/9PgXX+8FP6D
 HAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3K025mc744fwwg/JYRmYHCRp+jrks2XJXschLXeJe2I=;
 b=7+2O51Oe35DD/lUVibtgyRbHXxYZYG/kQ7g+DAVSppsaR9kQQvum7W51WV02SD54Ks
 APaBkmkwhBe9WmqqbTVE1Pxh8D76q9/IGvvt1HBMTUyx3tzIbpPfIbjPg2ixePVVi+5q
 egV/T47wpNpKeHfRG3MK1zGNed0ZRWqEzMrLKMrCx8jKeZ1+k7pTjdvn01MuGAjvR5jU
 xvTVmd8gsmh+ZsUuiReQ+8eGvS9j++FHPgY06X00eZeN+JRk2yfioqEjjetq3XR+GWRy
 czWpNxsurNIsGbMveOVqqK4vZE8ELyxe4FWAjNkmGnbNtAQD4ZM1OzxrQI1VMN3xL3DM
 apHg==
X-Gm-Message-State: AOAM533S6Jqcb0fEXbeYoRL6SmQ90hOKW4y0qGVdwt4/QtPEKPFbt/DW
 WdFLdtM3lLqKg6OwZiCHg0LlXw==
X-Google-Smtp-Source: ABdhPJznBt8Dbqeh1pk5qCr3CMscjgW6Dt9PvqupWNdc06K8Oo4fyFftuK7XEDq4HZScrGL5MD+yLQ==
X-Received: by 2002:a17:907:6ea4:: with SMTP id
 sh36mr1454494ejc.482.1641855831280; 
 Mon, 10 Jan 2022 15:03:51 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id mp9sm2890107ejc.106.2022.01.10.15.03.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 15:03:49 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: /usr/shared/qemu binaries
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
Date: Tue, 11 Jan 2022 01:03:48 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B5CE01E-D3CA-4057-999B-40CB8F77593D@livius.net>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=ilg@livius.net; helo=mail-ed1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 11 Jan 2022, at 00:55, Alistair Francis <alistair23@gmail.com> =
wrote:
>=20
> they are referred to internally,

Ok, so things are a bit more complicated than I hoped.

I'll search for the names in the source code, and keep those referred =
internally.


Thank you,

Liviu


