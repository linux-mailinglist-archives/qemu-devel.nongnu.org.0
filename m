Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A0D381F34
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:06:42 +0200 (CEST)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHPl-0005fU-Nl
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liHOf-0004g0-2x; Sun, 16 May 2021 10:05:33 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45040 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liHOd-0004Gy-1e; Sun, 16 May 2021 10:05:32 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-002-111-216.77.2.pool.telefonica.de [77.2.111.216])
 by csgraf.de (Postfix) with ESMTPSA id 78AF160803C7;
 Sun, 16 May 2021 16:05:28 +0200 (CEST)
Subject: Re: [PATCH] meson: Set implicit_include_directories to false
To: Katsuhiro Ueno <uenobk@gmail.com>, qemu-devel@nongnu.org
References: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <d75e2abf-2a0a-b243-2218-467e083e9939@csgraf.de>
Date: Sun, 16 May 2021 16:05:27 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 29.04.21 04:43, Katsuhiro Ueno wrote:
> Without this, libvixl cannot be compiled with macOS 11.3 SDK due to
> include file name conflict (usr/include/c++/v1/version conflicts with
> VERSION).
>
> Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>


I can confirm that this patch is required to build QEMU with current
XCode. I saw an identical patch from Akihiko (CC'ed) as well.

Tested-by: Alexander Graf <agraf@csgraf.de>


Alex



