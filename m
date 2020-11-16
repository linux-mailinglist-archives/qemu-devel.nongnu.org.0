Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0872B4EC5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:04:06 +0100 (CET)
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keirG-0005Dt-0L
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1keiow-0003sI-F9
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:01:42 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:53155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1keiop-0004tq-Gb
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:01:42 -0500
Received: from [192.168.100.1] ([82.252.130.226]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MCJzI-1kVKse0fhK-009SKm; Mon, 16 Nov 2020 19:01:26 +0100
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <511a36ae-3d76-e185-079a-ac3e89bcd9cd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: Deprecate the nios2-linux-user target?
Message-ID: <c16fb807-e8a6-f83a-cc7e-efaa5d0d353c@vivier.eu>
Date: Mon, 16 Nov 2020 19:01:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <511a36ae-3d76-e185-079a-ac3e89bcd9cd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1IWBhV+BzVdwk0/GJtHmvirh2rroG5ewZocVY9NSlo4wudlZ4pa
 b3YVzAR2mA91DeHawABsXxoOqMTaHyxxwQUxv+lfxMR6ZWPh+B+OJIZhGkJBnhQ18G0roDv
 v1oAps3VKH7RAmqeFpqEAtUogjtUEXeGxMQ9ZZUnt5vnETBbWhpJ2/P3h4fsVTPb2qvx0mn
 AymYf7t4Ttfxn1iDiX9DQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3nlIIc9VUXg=:b/SJq3Royp4xguok7CQMnY
 Encz6EW7ba6AUFLm+uP63y08y6Zsu/E63RuGIudLCGUznriP6fEkgJairDCFgOA97fNzmZfiX
 MUOFznTpSSPuVbC3aajQt2sS6oJPR6Gzp290Kj78ZoADrZafUopdnoyCVXN+gCWMzClGLxOou
 HpqM7j+BzAlcwKiTS0W2TRN7dL2zhbUj9GwPskJw2hX5vnY8h1yDdWkRhphVbX8i7K6trHZJO
 5jKtbuYJuvZ9QUU3ebar0V1LAa9iYylV8a4jONUqPY2KkK4TKIYaiq93PV8m7AT8ewMGNoAnH
 Umke5lWDybEB2Wa4WMVIExSSLhqAkTFllCzT6YR2l+MtuSxVtCHbQaBpzxKzdu0TyzBKnMAU4
 T/K/iQbo33sNnfodn8DleEwrrBxSkFAM3J9dueOALLmkYn5fRm/zPmKZs+PM+Oi5UYfP39Y55
 mSp9tKLqCQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:01:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/11/2020 à 17:01, Thomas Huth a écrit :
> 
>  Hi all,
> 
> looking at some bug reports in the launchpad bug tracker:
> 
> https://bugs.launchpad.net/qemu/+bug/1791763
> https://bugs.launchpad.net/qemu/+bug/1791796
> 
> ... it seems like the nios2-linux-user target is rather broken and
> neglected? Is anybody still using it? If not, should we mark it as deprecated?
> 

The problem in deprecating the target is if it is removed no one will
fix it. But if no one use it, do we need to fix it? But perhaps no one
uses it because it is broken...

From a linux-user maintenance point of view, I have no problem to keep
this target present (that does not mean alive).

The NiosII target has been introduced on the 01/2018 (ae5045ae5b2b),
and the bug reports filed on the 09/2018.

I think the decision to deprecate the linux-user target should be taken
by the NiosII TCG CPUs maintainers (Chris or Marek) as they have
introduced it in the current state.

Thanks,
Laurent


