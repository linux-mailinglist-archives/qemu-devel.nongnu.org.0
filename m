Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF1D2F7F59
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:20:36 +0100 (CET)
Received: from localhost ([::1]:58398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Qtv-0005lM-S3
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Qsg-0005Hw-3A
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:19:18 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Qse-0003rp-Do
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:19:17 -0500
Received: by mail-ej1-x630.google.com with SMTP id ke15so6133968ejc.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QWD/9ysrbLyxpll8pD7A4pE658AMXa268B6YkSiFa7w=;
 b=fWGEpDjLsm73miIzSdTe4G7rxh4g8fcO453PcYiB7Z3kzMGbjJKFuzaz6DLBCZelbv
 UdTM0dJRiCm+MnLhjTPpw4tkqaI91qJy4NnfDDTzYtV4bNGrXCSzb3B1oIhWynxmfj+q
 eE+YpJFh5KewUoHx2OEUt6Oex/5jM+lJnM/UsuGO3Nq/n7JjgJB3hcxvihH4HyUCAy80
 YqNCulTYo5veFYZV5qA4KrWuSbR7LHQqz1YFtTKksaz9nXz8XpnRcE5cin9t1WwbV/Nv
 WPl05TVF8kcdk9pT524D3WWiDJwaQtbequdRAsy9V5G4VRNtfbHPnw/iwntQA/xLmrju
 Oerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QWD/9ysrbLyxpll8pD7A4pE658AMXa268B6YkSiFa7w=;
 b=MoCQPpCfBq4+CbQWipzXGADOOwLes26qrS/uPNVD+eSVOudm9z4QhQ35uR8bBOaRDo
 c5n3FNnWnLUBH6s46TmM8ICKDJ+5OjIEItXp49fMTpyTozeGCbOhsBlg3DCsgT0ilfEd
 lle7f5YN6Y7appDU9iL6Xz8ol0cgkaIAMlUryDGvhlQ2bMzAlS2ti58k3ZiX8K0SibwO
 tHmB43maC6PjqAbI6tzSMfdaLKTkPG9Mb3Oa4wKEyImZrE5aCQ0ppXllMpj1cf2fEZF7
 eVTJ+CECJnXVSzKHGrbYRBgFZxFUYP4MO5u4r6yfpINggFrg/A5pCxB2gB4+poTo+Ejm
 IlSQ==
X-Gm-Message-State: AOAM5305lFLi0q4PaZqClKMf97/J+ObYJkqY+Dw+7bxGLft3CLiy9tef
 cs3JVMGoKjPUCgyYsyo+5cfVccnGfCI2yRYVt21Vvgkw1oo=
X-Google-Smtp-Source: ABdhPJwItdtH1CWUNAXRikiq9GfeAFxTn0k/x0piq9OaTIECtn7dwWLIspe+1cBRoc8PsWTT2Fo/ROy0qLYayBhWU+Y=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr9065530ejf.407.1610723954573; 
 Fri, 15 Jan 2021 07:19:14 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
In-Reply-To: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 15:19:03 +0000
Message-ID: <CAFEAcA-f4cueeYNr=i8w0LbdsNwJo3DMLAywsp5cOu7-P0wKCA@mail.gmail.com>
Subject: Re: Windows installer builds apparently broken since October?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 14:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> I was just trying to see what updates the qemu.nsi file needed for
> the merge-all-the-manuals-into-one-place change, and I discovered
> that it's been broken since October when we removed the Changelog file:
>
> File: "/tmp/qemu-test/src\Changelog" -> no files found.
> Usage: File [/nonfatal] [/a] ([/r] [/x filespec [...]] filespec [...] |
>    /oname=outfile one_file_only)
> Error in script "../src/qemu.nsi" on line 119 -- aborting creation process

...and if you fix that it then fails because it's looking for
a subdirectory share/ in the install dir and it doesn't exist...

thanks
-- PMM

