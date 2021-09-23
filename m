Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CD2415BBD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:06:28 +0200 (CEST)
Received: from localhost ([::1]:58030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLcZ-0001DD-Uc
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLbA-0000RJ-1y
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:05:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:57539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLb8-0008Rg-Cn
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:04:59 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MdvVu-1n28ic1bjK-00b1JT; Thu, 23 Sep 2021 12:04:56 +0200
Subject: Re: [PATCH v5 03/20] nubus-device: expose separate super slot memory
 region
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fab94de9-99da-f006-97a8-44d4892a37c1@vivier.eu>
Date: Thu, 23 Sep 2021 12:04:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oBLvmzYsfR7Muh5FBW40PT3RYV8uTrNbBlAJY9vwq6Dd3qppfZQ
 oMN0moT3gRsk6y/c7RDfRFadaKXsHi+j6rxyObOi7cE1+P95Vwvy68cBCysNEHeDB452983
 72y9IMI9pS1qxQe5bL/l5WoPnduTqgWy7PZwkhZuHXPoiWvF5SqxzdEdV3clTBpKpvv4bPF
 JdLvvKZ6OJMBWfysUFbsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HMeuvVodXHA=:6DS/BDkAYUPozmpCoZHltf
 fNu68n4WE/cg6jKQUqeSv5n9Cn8XJCyY4TWlw9t6Un2oohOkKOBAMJ6WEnIqLr2ltAKF+prNA
 mk7nSnypi8Kca/FofJ1ooTKm+ToC/abeAz2TqY1t/kosEy4yy3tBFdhb4ikfDgPHGQhP+gi2o
 R4+la6JCYVcU2707xFNl3WpJwIf8TQO6tJ6eXnfPjJekHawpBisewSiOx492zr39zRvGTcWE/
 EZ/+9uQIIs94FijNFfy8ZCL9DJN0g6vQHqbmY4vXulWGvW5OjYqfFt1TzM7HVRTm5EWzMFcJK
 J4HAblK9zsJasEgwlPJyGyKaxSyGrGQaHAvpk1YONjHX0rYhz4zDTN6lMio2GbWGSGePezHHY
 4n0vbEFgtZkkhoakw/T+Y8ideuZ/7PeT6kECIMKFUXIGyb9ECtkPih5cgLqpqXs2QGRA4Zst+
 ACyl2zrDNq/x8LfBIIsJCnjmRLUS22zFyYroJ1hlj4KR0Gb+vmY4rZxFaXYsRtVg6dEW83PLD
 LYUw2LycU2lXQ14ddhRhaMsNOz9XHM4W3QyTkZshqIY5lrA6nyu4s0IHJO37mZER9+bDS0JxN
 quaCKPZn9DwnTCyvCbKEYG7dsdUFrOB/WIiTmsF4AmsBsFkQAu5hs/kz39KuKbzwz3lM6imNM
 gyITws543Sjh7oHshpr/UJE9qrzZJWGMNSxo1kT9cBbkB0jX8QG5aaqeu0Nh6dR4FM9FsbYNH
 Ftel9yktEqX6/Ql6hy0D6hArUYwEVfvQW764Lg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
> According to "Designing Cards and Drivers for the Macintosh Family" each physical
> nubus slot can access 2 separate address ranges: a super slot memory region which
> is 256MB and a standard slot memory region which is 16MB.
> 
> Currently a Nubus device uses the physical slot number to determine whether it is
> using a standard slot memory region or a super slot memory region rather than
> exposing both memory regions for use as required.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/nubus-device.c  | 36 ++++++++++++++++++------------------
>  include/hw/nubus/nubus.h |  1 +
>  2 files changed, 19 insertions(+), 18 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

