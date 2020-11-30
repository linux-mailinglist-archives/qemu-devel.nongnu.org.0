Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E74C2C8CD8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:32:22 +0100 (CET)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnyH-0005XF-FE
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkml@metux.net>) id 1kjnwY-0004FY-PZ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:30:34 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:55581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkml@metux.net>) id 1kjnwW-0002hV-Nw
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:30:34 -0500
Received: from [192.168.1.155] ([95.115.99.253]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MjPYI-1kMFVU43FS-00kyh3 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020
 19:30:31 +0100
Subject: Re: [PATCH] python 3.5 compatibility
To: qemu-devel@nongnu.org
References: <20201127183619.8958-1-info@metux.net>
 <20201130094454.GA5078@merkur.fritz.box>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <a46b6a9e-cb72-68e8-c3f9-ef14a83fe1b9@metux.net>
Date: Mon, 30 Nov 2020 19:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201130094454.GA5078@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wyh94jG4PRxTGeR2moDpqypYw55BBv0EwQ5CZQqIJzsp4VQStu3
 mlG7FDKGOa+t9rPcjPdtRR3ASbhnWJt7EZZzZDZQ7hLTLyEUc/Kv2QDHQYzSOhP9RNz/g8L
 hdIMYan+8QilkRC8LlMLC8nObF+WoU8admgAQhMVcMhBz1ZvktsKPQVZQAgq39YR4+2Ai9j
 ZvSJd2PfyMkaTzSgiFNLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UzP7S2o4Azg=:k3jD9+xf8j0KvcuLxTfDaT
 wyLhHBLWfDXjYgWbuSWIANRKl/Y/UUFS6J+ZgahJu7655wOJwN32wcCs0weg9sOg98gUmuJSb
 AnBBtAje3BmmmDyHEE2daV089GSQ8jlh7+5W3cGEXd7v7dtw10sf0vOL7cY2NqxbTXUeaVBxw
 KsqoL9gk2phnLriVBDgLFZDkpXaU3tQwG9VKroLlrowwVrckD8NdojJbmdP8DV691ukXjTrsj
 kKA2Y2SwAQmz9tUprK8pAyvJde3fzaeFbhSWvgjumL7RLjVgScjfM3uWO6BeuMtX33woNhgWf
 ojybU1APAZmhK2JYmYb1ATQVGdDVqTmobIMsRyo1iF+VTa0IiV/grMqz4Gswdl5tDX5xgMDY/
 E0tUmK6fzJ6m72UfyOVQNHYz/1kzTdVdos9tWyxpBKaZoOnXFerRXdNNR8IzL
Received-SPF: none client-ip=212.227.126.130; envelope-from=lkml@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.11.20 10:44, Kevin Wolf wrote:

Hi,

> While type hints are valuable documentation, they are more than just
> that. They help to find and prevent avoidable bugs in the code. We are
> actively in the process of adding them to everything in the QAPI
> generator to improve maintainability rather than removing them.

IOW: I'll have to do lots of backporting work, just to keep it running :(


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

