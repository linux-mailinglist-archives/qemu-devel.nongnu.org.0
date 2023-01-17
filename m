Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE0E66DE48
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:56:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHlVV-00019z-V5; Tue, 17 Jan 2023 07:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHlVT-00019J-73; Tue, 17 Jan 2023 07:56:03 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHlVR-0002w8-6e; Tue, 17 Jan 2023 07:56:02 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MGgRW-1pUQgs3kdW-00Dpa8; Tue, 17 Jan 2023 13:55:53 +0100
Message-ID: <0c7b2a2e-1a2a-1221-7798-e8d0885a0af4@vivier.eu>
Date: Tue, 17 Jan 2023 13:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
Content-Language: fr
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Pierre-Yves Ritschard <pyr@spootnik.org>, qemu-devel@nongnu.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20221202151202.24851-1-pyr@spootnik.org>
 <45ba2636-bf79-560e-e22b-f9b56823658e@vivier.eu>
 <20230117124312.ebe4qpp6p3hjew32@sirius.home.kraxel.org>
 <Y8aaNY8oVZ4z8hTt@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y8aaNY8oVZ4z8hTt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5GQt5UYmnpQRmA8BZbJj5TLQeoFIBigHuGnvxjgA14C39kZWRZA
 eQBwv0+OAjTuE8d9LIGs163/sIXKJs/5fC7CmEUjHTMkrbbJz6aGdZ9O0rVxjDhbtnj8gLf
 U/ZpweC0YGP1g/SV609O648eNMCl2Q+pPFGw71BOQjZ2hAppwJgAcJhqUHWf4EJRsc+KmQZ
 hWJkbPsaHWmAvgIlwlulQ==
UI-OutboundReport: notjunk:1;M01:P0:UM39PQNt4Uo=;GtCagEV/F0R4rDlqkSDGHKE+w7+
 hTjKunFkLr/JRqDkHttn5XdOxoGfhLKJcsq96Z8Ec2yPheTx1/GsgabqyMy2rpDjKeXUF34hQ
 Sz90Wuag4sWZWrZnH813K4r2TkJ3W/juvYP3IuayegkonHnxZKWiecQriw1ILTfQvCW3j9rAw
 xy4KoikczZLL/El+a9GEbZENeVUd2xUzT44mmIZ0YSrpVQzdUHfs/EO1Jz7A6ormYLiVGjusW
 xFd1fZQSFkvxfCEfxwIVQq7iEA3dBaDitNTfBKssl265T51XkSvHkwvRHR0+LudIYVcV9hhXT
 JMcrZwQHfhM4+dwE5P5Xd1pVV0fjp60ECJrM1ypeot9D2D1uTOi9k8AycxgVChsXhOj7PaN2q
 8QtMi7VGxsFYD2k5Iko1Uqk4LPQdnBiGnZDMr0v0jgyhvlaQcfam66YEgDF3QCyro8xWUEYM0
 ya6HpuAtiMS9so6U/jvRlcQY65etE3ZC6g7EUITt/XD2qwGe4j0ylamYtMg7VJAR8NPFUUGDs
 gWZvqX8dClVx4KukGf/mke6nL5u6efvrESzJyb1KrBelUbDw5QASXDZwlcUjROnnclKjbM1pc
 dSLoZq/2v/m+7CxOSgTveV7CfdD4jRb2y6a2uPBDQama6sgqLXI5dFNGC7aerOvQHPQqDureG
 6QYqUYQWNklga9BWIKXLpuY1R4Hprw2Q7I08T2bkkQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 17/01/2023 à 13:53, Daniel P. Berrangé a écrit :
> On Tue, Jan 17, 2023 at 01:43:12PM +0100, Gerd Hoffmann wrote:
>> On Mon, Jan 16, 2023 at 07:15:08PM +0100, Laurent Vivier wrote:
>>> Hi Gerd,
>>>
>>> If this patch is correct I can queue it via trivial branch.
>>
>> proxying tcp websocket connections to a unix socket looks like
>> a reasonable use case to me.
>>
>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Please don't queue, this patch is not correct becasue it is failing
> to validate the 'websocket' parameter at all.

OK, I will not.

Thank you for the comment.

Laurent


