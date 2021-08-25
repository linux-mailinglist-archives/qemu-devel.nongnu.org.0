Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BAE3F7B8D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:28:11 +0200 (CEST)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwh2-0002Pz-Nk
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mIwg9-0001Z0-V5; Wed, 25 Aug 2021 13:27:09 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mIwg7-0001Xx-AS; Wed, 25 Aug 2021 13:27:09 -0400
Received: from [192.168.100.1] ([82.142.22.194]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUXlG-1mRdp616Dg-00QOu0; Wed, 25 Aug 2021 19:27:00 +0200
Subject: Re: [PATCH] scripts: Remove the "show-fixed-bugs.sh" file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210825142143.142037-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <34fc4f09-2831-f6e8-1b70-40d39b3eb835@vivier.eu>
Date: Wed, 25 Aug 2021 19:26:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825142143.142037-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9Ef0TtPlGYDv9Dyc4AWycbXgVJXXuGN8ftQ28fjcvwKATTAiqip
 BrrPqzY+ynL13yHBy/dVZIsv5LhxKw6j3bYSfLD1mxePbKkbroj5j4bVYkoxEndgabnJtxU
 D1VrvMuu4fKqC3mbK5RdlnlIfMcq5b0KwS5xKgjPQUsxNUJhRGQ6x7aty7gKEuYc2bajz1M
 nLWx5FaGvftbXJCmXW7tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T6RuxkfUJDE=:tjv6JN797TnUc4tclBIDFy
 sd4kqp3xe5kpyFgS4tpoJLiVIN7hrm/01zkNR8BV1WXFx8z/qFIzwhaD8ypEM1kPJU7xITKe3
 lCcNCxprX9QO8yLAHfUSdp2j2b2fu8WrOZWU434rpcgdFogDkCLEBErnzkwpCaPy+v7jX4bpH
 6VAe+TDbLVyXtMU6HBYuP1WnilUArMSZwECRC401CWxXvzBtCec+nkegEIZY91JcYCyuu7Xrg
 cJ3QykiAx3n+9/speufd7S3otUlX17MZzah7F0+hBYVBL3RNozWK6ctty70Uou/jY/GIvpM5c
 ZhvHUVhF5MjZzAF5sy1THHPGSlyB2nUqGy2W2qa9jOv/A7AMCKTGQoinbZ25rLMiubwgFdJjd
 Q706OMfRETg5KErtSpQj2edRZI9wafckiZvN3nBBoLnwHFqVvm3nNoPAHs0eGuh76WrSUD6ZG
 CGzE8kWRXgEwV8IYbh1D86RG9dmZtTiKeBHU2RaJbNOqU+6yT5OWyaafQ/NSXdyz1GEuTASBg
 ncfj2mykmdw2prhVHvIky19Nwp39xY6DSZP7qrmzD2duZdpkaDerJIQkeDVChZgbU/T2JWM8S
 QRBqcDfNhXwoDqoY2jhxQPVTgKH6X/WIep5BiBYlixq0QpTv0Uv+nTufkUEOl2ki0cR7pkqpI
 zsgx6hvDBfQE9QuokPn0JakRPBDx2ollOLQmfdGSX81fB8ckD8N0/Qxsd6lX9nlVEwFA2LdKY
 icjO7ynmCXOvj9oeq7k42Sm2OOhtXOCFWjtrLA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.24,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/08/2021 à 16:21, Thomas Huth a écrit :
> Since we are not using Launchpad anymore, there is no more need for
> this script.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/show-fixed-bugs.sh | 91 --------------------------------------
>  1 file changed, 91 deletions(-)
>  delete mode 100755 scripts/show-fixed-bugs.sh
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


