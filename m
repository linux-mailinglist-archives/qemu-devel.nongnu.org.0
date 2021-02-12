Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F73319750
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:14:58 +0100 (CET)
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAM6r-0002y7-9Q
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAM5S-00023r-UT
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:13:31 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAM5O-0004Cu-0m
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:13:30 -0500
Received: by mail-wr1-x435.google.com with SMTP id l12so5995595wry.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6pZmEQAMo+1RH+XeYGgX0AwHoS3fUpkskmLQuauFZVw=;
 b=eVQuEJ5fIVLwm3Jsw/30u/GIT1N30VI3w65zJ1PJxLAdz3yLPXxwS+PW+olzygHO+4
 2/JaCJxkMp/wx9v8D868MSpBYcKqf9mVn2qMoe3ihL1bYwzwQSC04P2V1m3V1jP0epek
 BUnWNsvHZ2NDa7hKXtj7mXseUUP527DlmxKd7RrVuIQGk10/oz4hKjqLeY0gNwZTfv+N
 vYMlzpG6kRDfr0DZ7G585DF503vKuhSQGajNSM8K3bsP4f5b9kIH2rHWEzLbq1oaheMF
 1WqtEfxHF0s2Jh54YnOocABXFfT+Ho+q0ktaa3/zU7uH+WMAH/1Jxjq1nGHtPt/g3+OF
 D7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6pZmEQAMo+1RH+XeYGgX0AwHoS3fUpkskmLQuauFZVw=;
 b=eRCxez02VVfnsc3b2B7aD2FPl5AZOPcTz43I2ojRe9g9ZSoqbCeeG31mX9ATEo8OUE
 5WrNFwGVcyseSoFbz857PYq9DX0lM5b0zhz27+qAfNt5vmjzT92o+NM7tk9COCERadNE
 BKXdxH/U6oIpYeMevVoY1elkD4jQjTPVyh/v8ot0fa3/xjNNWGOC5F4rW5fDqO8u4zSm
 Df5srgjoehPOjcRt2CvL6CU9cYk1Ug8v3oh7tv1yFnzMN7/lSAvZ+aZEJzqYXcWCBkt+
 Nhtt95q+c+9cejglAKzvJjdjtGNuwUFSK7q32LULCoN9suWNEETG7lEpOEduxpAxfgE8
 nooQ==
X-Gm-Message-State: AOAM533dfsj62oU9xa/XA8496Q/Zmo22eESMw8QGACwvlVuM2JHTpdGo
 FhFgHXoghnycOG8xrQu8Et0=
X-Google-Smtp-Source: ABdhPJzWgNJq9vp1VFMwaWpBxBS0p6+Ir5Dc6WYzwpEfHl67IacaeJ/S8X0VmtHh4gQBYf2ga1ycNg==
X-Received: by 2002:adf:b350:: with SMTP id k16mr353425wrd.190.1613088804243; 
 Thu, 11 Feb 2021 16:13:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm7771236wry.90.2021.02.11.16.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:13:23 -0800 (PST)
Subject: Re: RFC Qemu mipssim patches
To: Reinoud Zandijk <reinoud@NetBSD.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20210211153746.GA25676@dropje.13thmonkey.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <acf26892-c47c-7059-f3d1-8ef5bdcdcb8b@amsat.org>
Date: Fri, 12 Feb 2021 01:13:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211153746.GA25676@dropje.13thmonkey.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Reinoud,

On 2/11/21 4:37 PM, Reinoud Zandijk wrote:
> Hi,
> 
> i'd like to get the following simple patches to the MIPS/mipssim target adding
> virtio-mmio devices to it. This makes the target a lot more usefull as microvm
> for kernel developement. It currently lives in our qemu extensions patches and
> we have a working kernel that supports all virtio devices for it.
> 
> Thoughts?

Why not start a cleanly specified machine, as Laurent is doing on m68k?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg768802.html

This one doesn't even have an interrupt controller.

Cc'ing Aleksandar who maintains this machine.

Regards,

Phil.

