Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8E33BDCF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:40:13 +0100 (CET)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoOB-0005wq-L3
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLoM6-0004YS-Hk
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:38:04 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLoM4-0003d0-Ln
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:38:02 -0400
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MS4ab-1l9tSa08U7-00TX0i; Mon, 15 Mar 2021 15:37:47 +0100
Subject: Re: [PULL 5/9] char: add goldfish-tty
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210311210934.1935587-1-laurent@vivier.eu>
 <20210311210934.1935587-6-laurent@vivier.eu> <YE9GgQDw/TYD17Qf@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <738bc85a-b05e-e9c7-2ac5-39fb48103093@vivier.eu>
Date: Mon, 15 Mar 2021 15:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YE9GgQDw/TYD17Qf@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x4xw3r2rWjmNELpOfCKHI5QtM78Y+KlietpJ2z7gjM85hSnxqbl
 4V0V50+IGk+dNd7bkB1F5DB4WbuCQvuGPa537+Wqt3tCAjGPOHYeG764Zv9AnDWBRhJpbcN
 MbE80ejqqdLM7LBLdJxaH7YxY+d8TcASyBUSXp9Lod4Sm593X6dpaE2qJoh898eRIRHuTBj
 Ytmqn6n1bR7YMaOe+H+WQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FrgfOIJliUE=:UOkRxft5lcEZ8VTMzNJjY4
 9Mo6ms3TC2EkadAQkn0ffKaAkzYi1rJtI9wb0wCOzu2KZEqD2HmjXvLBhfbw5BN1BFk32krt0
 B5tfocPaO9BfWRTdpWK9BolmlmmgsUpbAOI8lA7deNub1twuq8Y4FN2GcTA/vGluqNs8GOC42
 RwEWxhpBGJ0Bz0dIHunRMJCbBbD4LsVV1R3eDAQYM8vW36P6PvOO4izUHUI2K6uiGDMCG6KhW
 RyJEzf/ifuKucpNV76NBflRQwb2gRq8psjqvV9B3m+58S8YHmBRtFzU/ZxEJ6PnrLxED7ZP+5
 KlqrE4DiTwTyKDsQzysidVWVUJdXk+f1WlgyDW5na62bsMFXlneJlcT1bArVjpwh7cZx8aMmW
 yn/EbPmbQ12sb7gj7Nynq3ImJpMbrFRxxu21b0PhIgPHh9OwWcdm7w82wDmER
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/03/2021 à 12:35, Daniel P. Berrangé a écrit :
> Nitpick, use  'hw/char' in the subject, as I mistakenly thought
> this was touching the char/ backend initially.
> 

I sent a v8 without changing the subject (after this PR but before your comment), but if there is no
v9 I will update it in the pull request.

Thanks,
Laurent

