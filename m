Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6F60799F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:31:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olt3A-0001uK-V2
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:31:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olt31-0003ZP-Mw
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olt2p-0001qy-8A
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:30:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olt2l-0006sQ-Fk
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:30:42 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxVfj-1p1V5b3F73-00xtSM; Fri, 21 Oct 2022 16:30:30 +0200
Message-ID: <d51ca4c0-6115-7ed3-a6be-dec67bdbfdb0@vivier.eu>
Date: Fri, 21 Oct 2022 16:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: fr, en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-4-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 3/4] meson: enforce a minimum Linux kernel headers version
 >= 4.18
In-Reply-To: <20221004093206.652431-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wp9AaF75yQJi05S44fLPNQdmYlVK3dS9cQj9a4yojc//SMHWQQ/
 tnJfkju3xOskW3S/RtfO6deyJBv6M50lDPry2tV48PyIfmXi5RPWR8COHCH+1Ulvz8sVC9t
 cv6B8Qb1amem8QnViGejT1QcRf+40gg9ZXiqNXax8ryGVsdarGdzb3REyKKfFTHwot5svsG
 NTTls/4q4PWR1M+2H/UKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wvDpQK0PdKQ=:XZrHWnY89y+wnsNAKif8rD
 zW3chgNGhwLKmoEKnDxsjp0kfPF0LlwOgAI1KZVFwNw2idIB4GbC1Ua7v6m8Di1A0XIM81Ffj
 zHpcYfB7MECP3d7pg9nOyuh/kZ4MNHN6NfCDvvQH0OGCi+HWenJORsPow3Zk41rj/ytfX2yvY
 0XtE9rDfnK5iL1GZnAxv7OV1L4ZbbiZpBLoxjTRTnYtAMd1XQd4c1ud32I3IQswMD28O9z7fp
 RSEsV6e9zPxEoHaz7Ny8GWOkmMKDqxb4ZCli+KeNic9Fo0gpooVeMxYu/fIINqYHwp92065BQ
 BXrutP8sHdBPZXFHZNB+n/z1ObPOjN4soxSoaDNHevpsFcVQctGmSW0ALAs/+I/VK6tFs+tos
 lu6EtruYDbyXf8ryjHcsHbxQRgltaovE/Gcln4ECY6G9xM+1hxV1jv41Ap6Deo+cz3Ke6Vmqf
 Ts6GML4vmY635ZroWZm1JKrVCUg29SBVDa/Ashfak4ubUJgfj2b+iRPa6/YHx5LR+7tKcSHbN
 pq25bpjsF3uUD5/8RGJNZ6vm+CBDj/2LtrGp8hYAbkFjdS6TRG+CUEc5+Jj7oskhwLUyV8dhl
 T4msk3lACmgCwptIl/KqBiEsI1lOvOqnz0s1wD5HTi+qWtIc4gLWp/tsFPMNeCESZFfy5mPQB
 Y7rywJKifjNNn7GxOzZovriMVnjhcR4shTRpj0jbH29Jj228RyAtlMbnxHg3q2DZdLDIT5nM2
 6nWtUWyhb5bxM8EJu5CqqZxSDVsy4wRRPQb5lIp9HijwRCxf6DdI0eACPQqRg1svf/f/CbC9K
 OZwv5hX
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/10/2022 à 11:32, Daniel P. Berrangé a écrit :
> Various areas of QEMU have a dependency on Linux kernel header
> definitions. This falls under the scope of our supported platforms
> matrix, but historically we've not checked for a minimum kernel
> headers version. This has made it unclear when we can drop support
> for older kernel headers.
> 
>    * Alpine 3.14: 5.10
>    * CentOS 8: 4.18
>    * CentOS 9: 5.14
>    * Debian 10: 4.19
>    * Debian 11: 5.10
>    * Fedora 35: 5.19
>    * Fedora 36: 5.19
>    * OpenSUSE 15.3: 5.3.0
>    * Ubuntu 20.04: 5.4
>    * Ubuntu 22.04: 5.15
> 
> The above ignores the 3rd version digit since distros update their
> packages periodically and such updates don't generally affect public
> APIs to the extent that it matters for our build time check.
> 
> Overall, we can set the baseline to 4.18 currently.

As this change affects entire QEMU build, I'd prefer to have some "Acked-by" before merging it via 
linux-user branch.

Thanks,
Laurent


