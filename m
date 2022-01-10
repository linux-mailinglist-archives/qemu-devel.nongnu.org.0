Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6E4899FF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:33:45 +0100 (CET)
Received: from localhost ([::1]:51950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6unw-0008VK-Bm
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6ucp-00015G-Sb
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:22:17 -0500
Received: from [2a00:1450:4864:20::432] (port=41574
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6uco-0001yg-Gw
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:22:15 -0500
Received: by mail-wr1-x432.google.com with SMTP id v6so26663968wra.8
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2reBUfViVCBEm4O3CR/ZHC9ZtfhrfTVMiNhU02FfGUk=;
 b=Fj5WENYomEBQb1LLjDxIRr9kLVqHAJXwiq3Z427NeSgPb9xynzUNsvew/1wcX85mhO
 S4OuaHDr0jgILoweWulD87eNpGdQtnRE1aPvVvocz4XrOULH/O1WfKHQj1PapbAitnKs
 VOcW1Dp2gO1SZNzXLYN15+ntudDM10moNMx+apYvuHYztcGFojLUN66zjczEozJoxXoy
 G3b/m5SsBGdbl1heC9x1SAANBJP1noPJxrRFm6Unmlv7Z0EYPns7O5puQHMTEp1BsHr4
 ircviTn6nxzoW3YS+bqCY+q5BNF3mJb0FQSc1VLCxAwGKaLslz8EEbED1Fudr5xLWsxN
 Ptqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2reBUfViVCBEm4O3CR/ZHC9ZtfhrfTVMiNhU02FfGUk=;
 b=zqwt85bjcJISPJmagGKWESQIHoFInTdPJNH2/MgRUeKsffYuooTeIlCaLhr31TNSA7
 2QcYCl8BuvFcPVybNLJhZD5HX1Zdp/MMvMD1qSU1ajS4XyKfJI2bkTDIYkukLOlSueoe
 S4uJBD0RgFJRLkSGySK5GTqpQ5z7f7SvpHESrPKMcBqRke8GhOA0Q6i7iuHCX/pgcFpi
 Naf9GDtxTr+gmV1rqB3UH1G+o8RzeXLY44YjdpoVrHziKxHwaMUnxlWgYx5CsrDzYluW
 5Cxyn92l3C79688Xi3czpKxOiW0mJv1VpoTW5O2fIY56wC2A1hGVW3d4whKSew52ObMx
 brkg==
X-Gm-Message-State: AOAM532V56Pr9dnS7J0tiicYvY/mTQgaLqwH428JJWRDvWLNpegnXrub
 bW8HObJu+TJmxMEX1nc5E26oyIHu5WH1VwHxZJB3gg==
X-Google-Smtp-Source: ABdhPJxX+EeoqA5xTFMfVaZXDuUqxso7oEVHR+BlGffQuANBsJHCLt0oYzjm/Zzzgm11GgEpqIUlLZYcAW4AB4zZTTg=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr63479864wri.295.1641820931407; 
 Mon, 10 Jan 2022 05:22:11 -0800 (PST)
MIME-Version: 1.0
References: <20220109170612.574104-1-f4bug@amsat.org>
 <742a1bca-1150-c277-c498-3815ef956f58@amsat.org>
 <4993ab11-570b-2bd7-a9b9-c6ddc9af5802@amsat.org> <2147921.xlN1UyrzLN@silver>
In-Reply-To: <2147921.xlN1UyrzLN@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 13:22:00 +0000
Message-ID: <CAFEAcA94iQ_-dkNaQD62qSb_5emY5mq=OvR8jAbDkcW0YwUoeA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 13:14, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
> I'd suggest to use:
>
> #if !defined(MAC_OS_VERSION_12_0) ||
>     (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> #endif

This is also how we do this for existing checks of this sort,
like the one in osdep.h for qemu_thread_jit_execute().

-- PMM

