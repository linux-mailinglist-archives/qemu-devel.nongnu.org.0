Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFFE2F3BD8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:33:40 +0100 (CET)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRIJ-0005Rn-4j
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzRFB-000422-NF
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:30:27 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzRF8-00012S-UX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:30:25 -0500
Received: by mail-ed1-x530.google.com with SMTP id dk8so4023974edb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ZqTi3+uS+hmt/C4r/HemJT5cta6o5A0vvkxjmgRmGs=;
 b=kVH/o69+FYii1d9Jp3A/PVOVJcFvVaXo3HSCfG04YzrBh2I3hpAkL4TDA/5OaGSrkK
 l8/fyaxDSOyiqU+jQq4qZrNHzQPrcHFbqSP8WKE3+RpBog3ed3tMZMVEyMYmrkEd4cf9
 VSGtIi7ovNm+7qAS4nVIlL/9lNHBBvX0/+xIDIkhSIF5ZC4WgkvOuQiPZ94/e+xIFIvO
 Uhm4OXnPP8ERP1LE6o1Gt7Aer/cSoSa1e0KvJaTLOPSjtlMco5EYbsiZ65CDpRhLDmmE
 5aUjSmACb5wr9z3SOxtp3PYSpYHKEyUi6TGZ7MnYeHZbBGL3LTAxpQjQOhtjlZD4Th/T
 TxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ZqTi3+uS+hmt/C4r/HemJT5cta6o5A0vvkxjmgRmGs=;
 b=Dlr3+M64eb8r0wW3qc0LpExI7jTHAM14Tz2t0I3oSCLRW/BZPQxU9RF+kBAqjm2ziU
 uV9LKDkv00aQ37/p5wIgepzxHrwSVADnQaQlKdQ+BGW8aFzuLd/8+lMe1JpW+3Y7oyhz
 98s+OynGS1K8wD2ZoFU210TPQ+yFK5KaUDhuotg4DC8Rqa8YIKFe2RJlWocwxHxb9eZy
 mdLAh8IR/NO5cd1lkiBzg0C7Lz7vnoUqfG+OkPbN3HqEppozp5rFIi8gossVkGXUx7F0
 zfjG1f6ARkkxxP82cyl528y2T8GCtVKOSkt/OyQPk93EIIDFzws1z8czsPsRcn0LtBLM
 uHTQ==
X-Gm-Message-State: AOAM531gdODMGkD8CqzgidFyZHS8oTXIXBiOuQMFRzX8vkY1wKbIqZWW
 9i/7SMoJ+7e1qjWlyXx7KWsJlCl9zySwapxOhzOFng==
X-Google-Smtp-Source: ABdhPJw0gpAEGNWHxwRPveZDa1CV991Zlt4uUvUshmDpDhGu913xbG2ZZ+8TnZxkaMBfFv+AxCtFVFus/PZbiHvsUKs=
X-Received: by 2002:a05:6402:366:: with SMTP id s6mr906621edw.44.1610487021227; 
 Tue, 12 Jan 2021 13:30:21 -0800 (PST)
MIME-Version: 1.0
References: <1610486730-4970-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1610486730-4970-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 21:30:10 +0000
Message-ID: <CAFEAcA8LA1k9OeLbXW1fXtkFAu4Rj2YJry1iit1S92a-tHr9Dg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/tcg/multiarch/testthread.c: Add pthread_cancel
 test
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Tue, 12 Jan 2021 at 21:27, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>

What's the motivation for adding this test? Did we have
a bug we fixed which this would be the regression test for?
Some other reason why it seems like a good test case?
This is the sort of thing that it's useful to put in the
commit message...

thanks
-- PMM

