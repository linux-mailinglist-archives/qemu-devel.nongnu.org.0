Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288E415BFC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:33:05 +0200 (CEST)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM2K-0007Ki-7P
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLzb-0005Gl-So
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:30:15 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLza-0004rU-DK
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:30:15 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MZkYx-1mOcV808xD-00WpqH; Thu, 23 Sep 2021 12:30:13 +0200
Subject: Re: [PATCH v5 05/20] nubus: move slot bitmap checks from NubusDevice
 realize() to BusClass check_address()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <459e7ce4-e481-78e0-4a80-d699eebfb8ad@vivier.eu>
Date: Thu, 23 Sep 2021 12:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BWlDMr6IYoc/eD3DtZ839KxiavxaYqhmNnuZ/uub8Urh+oOMaql
 Wsw+7LXmNMm2MqnkFoKkhm9dMaVtVc8qqy2a1Hdfne4HtFFudEWmtHfn3PvBVAZCsvWceqx
 PjyEQy2aEcuipXFw9PRxKHohjaTg2dcshsDiMieHpXxjQMXF3f/1OwnWGDghjg2sbaB6HV1
 yZrUKhVZBkCzbohUnTQ4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7oj1q+2hEjA=:q4sSX73YpQOVwVUBHxnstQ
 08klLwhlq2My34Mth5V+ijAIiT6NzbnqBJCr8/Ezn/5hSzt9qRD/HY18UocTG1HlbEaOGKQJn
 h3wTkaVbmma0fn6LfzFcTytw9BFli6gxRivJXnhiZ0uiG3etZMZv353e7ouFOYklCDxGu4Swu
 DHAfQvR/zSQR2AnJ3kGtsSaBQ2TwMyUO1W4Lov40oe707CTs6ATbCwrsxZmouBpnlaB1yFQPZ
 c81ao/hFjJ6jmKNoP5LucPKqOeetaNG7qFaKBvFDTdWVTQaOSoe3C36EuKtuHdowcCZIRL4Gb
 B3x7l93Yr/OgS2RnE1bxL+boHC/5iUo8bEVrZs2Bm9yHds67nO6G6XA5GzEF2Bl3pP8V1Por+
 sO7dXJXuePPj9vWyhTC1zww9XvNv59m95GcZh+TycHYmwBU+3gWyDG007t1wT13fg4eqvsnug
 Z9MIf/jVVeb5zSn/ehh6Lh5AYHxbLY5V9MqF2Aw+fkW1t/FQ0IFWWAt5BemfS3mLMQhS+PGku
 kfQklD0i2B0tcCNLDJwZ1xjb8qtegzcOznlJWxccDXBYSLViDuZA4Xt8DswWWmpWDrCgIcmpM
 LI+0XqJdjBWH3Z+phMB5IHn0il9jl/0gPCqcIyknSgmOxV4/hPWhD6qiN3iMYOmW++CGZ6kkR
 zxCDJFbnPjpXgwe/Sw+Ly9oG+XyDbG0YJ9edkZC2MfSo5PkleZ42b5z1QE2D7raVqF8a22jxu
 WwDpmo/PD7uKNoIlkXiBfUPO0bJyCrvZLVW3pA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 23/09/2021 à 11:12, Mark Cave-Ayland a écrit :
> Allow Nubus to manage the slot allocations itself using the BusClass check_address()
> virtual function rather than managing this during NubusDevice realize().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/nubus/nubus-bus.c    | 30 ++++++++++++++++++++++++++++++
>  hw/nubus/nubus-device.c | 22 ----------------------
>  2 files changed, 30 insertions(+), 22 deletions(-)
> 
>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


