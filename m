Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6627319156
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:44:39 +0100 (CET)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAG18-0004lB-LE
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAFuM-0006pq-U0
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:37:39 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAFuJ-0004EB-Qm
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:37:38 -0500
Received: by mail-pg1-x533.google.com with SMTP id z21so4397496pgj.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNS0XkCChwAyOt6UnTZd4CJ2RGfAkFAjuEnpdQ+OmVE=;
 b=tdXCM47qLGCZkyZv2/6fBejov2ukzG1WeyTJ7sZ5MRI/lgSUNXxtOZ+ylfXp2eO9Ob
 d/pp58a17GImk8ssXU5HwsKE4OHaJB915HD1Dd0nLfprQ0itucHh0pKXWyBNE3YZVMhW
 EjKMqLkMKs96/SJ7R7yV57za/PDtpM6PvJObcHXjVB1rBbl9Po+e9OH2ziZrQGMfgx51
 5bNLyI7FaAmJzcwJC31CvTjKmFJBxPrIje0McwQ/VgvX/oqvtxuDnA598puFNyVPJQvr
 3kgeJ1P4zYcrZzhZA1wIwhT9Upk2NIubWN8ilE8jjA7UnCi1vrnmJfdJKf4sx5oS1yjC
 j1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNS0XkCChwAyOt6UnTZd4CJ2RGfAkFAjuEnpdQ+OmVE=;
 b=Eq6vi8nFCstC+6DIXZyvD/a0nDrWvZMRmEzzIYMM8L+nDFPKmm9fONLY0EUojT7wrO
 D5x4no2qV5q8LQv641DS0EdNG32C6rOknkLEdxylikcw/5M56qJUwpqAc93dk/TmbFLY
 1Eu3NsqsFlnYKmmULZVOhAxBTjv6fkdqvNxXI1LbHRi8EFKIrzFEWLK6yaQzTsx86laO
 FLBo7Y2JVAI52qMZRnuGvV6XWP8KDMTIXycmyhocy5qvf0vFQkeYozZA/E/OzZrUA7B9
 mcrTmfK/SAD/qS4288dzt5iw/ASGibON4nGf21Hep3B7SBY9B6hU6Us1ZN97DUyE/wHg
 c/Nw==
X-Gm-Message-State: AOAM532wKEq74pOHmqosqBn0aIOvd8pF1KK99QMPeLxKibwyGefgRQxl
 4YvPeDw+d6ULTt6o3z6TYLZJUS6nnSg8O360di0i3Q==
X-Google-Smtp-Source: ABdhPJxrJuUckCl6rS+OVDyBD2bIr+oTv2MlTH2k8abnOVqVMCrZwWwpblvgBoqrKN6NkW1cE4VV1vk6MTh0Ao6FAIk=
X-Received: by 2002:a63:c4a:: with SMTP id 10mr9224648pgm.397.1613065053991;
 Thu, 11 Feb 2021 09:37:33 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
 <CAFEAcA_S81bnYVcNENW9bFApAc-Ob1uKQncsGPmyFD034p2FOA@mail.gmail.com>
 <20210211172541.GA2316309@localhost.localdomain>
In-Reply-To: <20210211172541.GA2316309@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 17:37:20 +0000
Message-ID: <CAFEAcA-3M_CaNEiZHohH-RdxYP1Cn=5s+UXYTYE1e7YhoN2+tg@mail.gmail.com>
Subject: Re: runaway avocado
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 17:25, Cleber Rosa <crosa@redhat.com> wrote:
> IIUC, this specic issue was caused by a runaway QEMU.  Granted, it was
> started by an Avocado test.  I've opened a bug report to look into the
> possibilities to mitigate or prevent this from happening again:

I wonder if we could have avocado run all our acceptance cases
under a 'ulimit -f' setting that restricts the amount of disk
space they can use? That would restrict the damage that could
be done by any runaways. A CPU usage limit might also be good.

thanks
-- PMM

