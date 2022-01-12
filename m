Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2970448C67C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:51:48 +0100 (CET)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eyZ-00031x-8y
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:51:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7e7k-0008I2-VR
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:57:15 -0500
Received: from [2a00:1450:4864:20::32e] (port=35815
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7e7j-0002Hs-Cj
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:57:12 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso2901386wmj.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJJp1rQrNlXtpuUoimgF8LvQxLePq6gG1RWr81bFwhs=;
 b=ie82u1ahNqvLDxKa9tcG3IxA31luo1TKxsqVx2wVlvNqmZvYEj4pQsxqX+C5KJFaKM
 5acXVRZb0DJVBvAwOcJXQKg/nkJX37YO3MoRVisRkGoTgea+Nb6paKTxl6rzhW3MvQD7
 /0iFXoBRm4BasAE6EHCJJcLhv990ctVhaEQJHJr6I/8NeKbdpTOWWmEtuWLb1xZe64EK
 lnMuf+cQVkjCd8mOiSq79TnKVsR0N1wDYY0FYWze1g0cGnskOtuDefOPsygJwdBacHgM
 FsSU9tlh4oXBntwgmwVTS/gGiRsMDVAh8ClVri7k4z2FK9bttMNmxslOD+wf2liwUPek
 TQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJJp1rQrNlXtpuUoimgF8LvQxLePq6gG1RWr81bFwhs=;
 b=QGyXP8A2eggyMviYKJUtyNK0RU9XXlQlwSFwTTmyi2Q/Hvxt5q4kNzs/I0iGvcU/CS
 LU4qy1bI8NaIFez8pLwsSzRMsobXYz4cxk0CAx+iHBJrfZozKMYDk8TwyJBqOXAfoZTt
 JvjELiU0yV1GE7tsFkVK9a5ttEYUG7sduxXD8fru7h4aJdatkMMJhtPzEIAw12C2rdmN
 eELlYWR29h0vMw0gHPKudtF9z9XBpfa0m9/2OAPRCai9aEUqIaE2HPpqHWkFfSpkMpmq
 zIeTJ6B/FF1uloVwA9KmelVJlf3rc7pEarGnEAwrNXUseptRNqTDmzE1fSnXnwErQ+80
 z5Kw==
X-Gm-Message-State: AOAM530HzZMjWw2s7fuuU1P4pWp99DID37DEoa8lif0FKhplehaxcp90
 wJP5TkXtZR58WA2MgeDA5Icp1QrYPHTuoBHA1dbwGg==
X-Google-Smtp-Source: ABdhPJwyZdCIPo7vNpDigwidTn9B1ePC+T7Ldbrh5KLuk0FxoS3kb+0v3i76iyrgWzKUwAjBhT2iFgJGs7xEgh3IRiM=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr6728006wmd.37.1641995828584; 
 Wed, 12 Jan 2022 05:57:08 -0800 (PST)
MIME-Version: 1.0
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
 <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
In-Reply-To: <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 13:56:57 +0000
Message-ID: <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
Subject: Re: /usr/shared/qemu binaries
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 13:53, Liviu Ionescu <ilg@livius.net> wrote:
> >> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-aarch64-code.fd
> >> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-arm-code.fd
> >> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-arm-vars.fd
>
> These are the top 3 largest files. They are referred as "@DATADIR@/edk2-aarch64-code.fd" from the JSONs in the firmware folder.
>
> Any idea when are these files used?

Those are UEFI firmware images which are suitable for using with
the arm/aarch64 "virt" board. They're only used if the user specifically
asks to use them on the command line (eg with
"-drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd" or
similar).

-- PMM

