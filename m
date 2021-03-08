Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D353313E1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:54:01 +0100 (CET)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJ8q-0001Ss-Ux
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lJJ4m-00084y-90
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:49:49 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:44234
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lJJ4T-0005ov-UL
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:49:45 -0500
Received: from [134.155.36.161] (bss11.bib.uni-mannheim.de [134.155.36.161])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id CEB60DA01C3;
 Mon,  8 Mar 2021 17:49:25 +0100 (CET)
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.2 release
To: Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>
References: <20210307155654.993-1-imp@bsdimp.com>
 <20210307155654.993-2-imp@bsdimp.com>
 <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
 <CANCZdfq+ocyZnMt2td3ynx3gWqdPm1csddTjuhAEbxV-QL3Gow@mail.gmail.com>
 <f48b0f77-02e7-fcf7-a8bd-9d7990c8db33@redhat.com>
 <E0C80BD2-323B-4101-8DC4-8A920B6CE5AB@yadro.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <0f299c84-01c6-8a9c-6b58-82bede4cdfe0@weilnetz.de>
Date: Mon, 8 Mar 2021 17:49:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <E0C80BD2-323B-4101-8DC4-8A920B6CE5AB@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.03.21 um 16:46 schrieb Roman Bolshakov:

> gnutls failures on macOS and FreeBSD (with clang as main compiler) won’t happen only if libtasn1 from master is used. Otherwise libtasn1 has to be compiled with -O1/-O0.


Of course it is also possible to patch older versions of libtasn1 to
make them work with clang -O2.

Stefan



