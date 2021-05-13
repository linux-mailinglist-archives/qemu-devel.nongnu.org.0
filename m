Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08DB37F901
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:46:41 +0200 (CEST)
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBfj-000853-Hv
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBeU-0007JO-54
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:45:22 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBeS-00012i-Jv
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:45:21 -0400
Received: by mail-ej1-x636.google.com with SMTP id c22so11828016ejd.12
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RsmVzEyuOTo4PMF01ylHfE0oAjAZR7G4IN9Hu4X+Mjs=;
 b=Ld1wXbv3Gd6qunmAHSk0mnmEBDaN+C9hosxHKUQQq8UArpdkd1GKF/toG9eOzST7gx
 0+m1jQzxbEbNz01kKO4+1/3dm3WON7Fl13vZ7o3wsWmFRtXSui1VRYe21czxKBJq8p/4
 p2g1mlwDkrLxOWOeACLgUdtB9rEyH/0mkQyvpdzHnzGfCmavofjnHExlubNyEgdqmNJY
 aKIecpuHPLkEWbSWlio8tH5qII0a2wVL99dncHzLxrM8/hfbtuXE3pMbDz3WPIkWmAjb
 9gcN3Y0D42rG1cYVpuJTHVkaeIfU9t2YCOs2k74b0PqLnybvAQA56USF3WbiKBVtEjHq
 2f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RsmVzEyuOTo4PMF01ylHfE0oAjAZR7G4IN9Hu4X+Mjs=;
 b=Jxo77l/oxnXUVRjNT+F1gWML25z46ksqGvBqE4hRMQM657MkNGtl8rgPKAxOmRN2CS
 Ow+B2XhV6xmR6kdrxvnNO1spy5Pc8fjyc5ADhxL7yajERExOW5H5aTauuhAzsqPdMrf+
 DbSdqn+dOLS9y3r4QGIV14ztPjqE/ythIyvzkQ1pyDxh6LXnK+E0BRyWTA7TFWGXbuZV
 eELyCd8mLQJt2B+/uMioVNE8gHQtSwnCS/tydojaODZynxpAXBw9nmKObpzIDesW4rU/
 0444sAudq7P0n8sDkWRvyOsQ1l3b+BPBGF8IX7zW5dRAqGRe2T6TJj/k3CVMMKtzYKMT
 IT9g==
X-Gm-Message-State: AOAM532uqGKboFygjlUc2eDvnTFhRWf5f34K88RqkejQCaplMg1wfRl6
 BoFkbZIydzI53ZTfErteTB1qO1kUQ6cUmLOFzwQ4Yw==
X-Google-Smtp-Source: ABdhPJwCeyWsiAkrek2l5TSEl5vqG2RdI9AIS0MTcUrZeEpNuWWYzrMnyWJxWp4+2b6+Ue0qsIWGxU8ymO/cDX+v19g=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr4890548ejb.85.1620913519134; 
 Thu, 13 May 2021 06:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
 <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
 <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
 <CAFEAcA-ED+C+hnK_4jfK5JRLQ5mFW=XM-bPnD5O1ZmnEFH7XbA@mail.gmail.com>
 <CAFEAcA_zT-LW1eApzs5+TZLWkigCokY6S2Dc46pqVyiDuMLTUw@mail.gmail.com>
In-Reply-To: <CAFEAcA_zT-LW1eApzs5+TZLWkigCokY6S2Dc46pqVyiDuMLTUw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:45:07 +0100
Message-ID: <CAFEAcA8qV0Re8AYHpW14-1wkUcGacO7E6+ta-DWwj-9pN0iVOw@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 20:31, Peter Maydell <peter.maydell@linaro.org> wrote:
> I should be able to deal with this by installing the rtd theme on
> the host. I'll retry merging the pullreq.

On try 2 I find that some of my machines warn:

Program qemu-keymap found: NO
Program sphinx-build found: YES
../../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
Theme error:
unsupported theme option 'style_nav_header_background' given

Program python3 found: YES (/usr/bin/python3)
Program diff found: YES

It looks like this is because it's trying to use an option
that's only present in newer versions of the theme. (Ubuntu
bionic has version 0.2.4 of the rtd theme.)

Is it possible to either avoid or conditionalize the use of
this config setting?

thanks
-- PMM

