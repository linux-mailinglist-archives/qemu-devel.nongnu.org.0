Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092A543304D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:59:46 +0200 (CEST)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck2D-0006RH-5a
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjze-00035Y-Ae; Tue, 19 Oct 2021 03:57:08 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:58269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjzb-0000va-Sg; Tue, 19 Oct 2021 03:57:06 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mm9NA-1n3F7a396W-00iFx2; Tue, 19 Oct 2021 09:56:58 +0200
Subject: Re: [PATCH 0/2] analyze-migration.py: trivial fixes
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211015131645.501281-1-lvivier@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3db7ddcd-9e4d-5d23-1479-2aa46d2becce@vivier.eu>
Date: Tue, 19 Oct 2021 09:56:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211015131645.501281-1-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1apv2kCUtZH9J6G7LovSkyIfkvWCaggxLGYf5Q7Mf7OxxBivVly
 0bHtktuAn8C0eOJrM5HeBsI1PvXu0iXk/fLjf+0q1DhkzoFbzuAIJvPvd5sOsTiIRnBv3DX
 0ba7b7RuKv2hx5MR1L4e/7IUm3/YvDz13TKSYVpg0PZcyyBWUoCtejLCqa3aeLCenfWKzqt
 WbTk74956E93j+UGiS3TA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kwQbR2hF3jc=:lZX9RyrupegJYPmfAmxMLm
 YH25sqqwOnsmHHD/aWNbla2CsJ0DlPBrd33sWsQunEpI6zulTdcFmETnTjr+3xFe6+w1yc9XY
 qJKWYKM0Yxfj95L2ivibwVib+9uq787eFxenOaZVzrmJoLxYzJJPyF3gC9k+KU+vucHplWtdf
 xKM46UyLIU22J9aVKQAbwigOpAe5drjPUKeBAnxCVDr6TKSlnVAwgGDg+ZQeQ8zIaYjKBktf9
 an4Dfc3EzDZNQINkWxTYai7wxeClJ526R5uJyETdWcWViXgFiSSFDG5QLe7QAdwdtOgCon69B
 bCx1FIuOW5J3BPN8pzSCtUtUEC8jeqVJLp1xjAFwjzjf4DjPVTCLs0+qEsQev8zKzdZtfd7hj
 7EKk7XRo+OWW3LE+/ZovnNLRIfWiG9bfy/7+EObH2pdFEVPmU2dXOk8gdsT0062ciYWttaOND
 6H6fic1EtEsUpKjCW6YPsFmyd/f1SRIfL3iT0VUr92WA5aRYPPqIMgULL10fM3Gt+SQgaH+R9
 VkMghjOkguYt0L8j1UCWNK8go3KEzM1bHsArpK12OaqNE2bpYENcsF/qmtom3mlKU0tdYWj3q
 NyJJHyqPjPz6OxmxyQV8OfEFWFeicW5alDE9hMB6Z3b2hlDYLIqKHm+qVSJPE/VFuf5fugOc2
 c2w71mjjugOCfVcvZhgerx5Njx1m9bY6nshRJ9PgZYw8khvWJD2vkSrCikvMF21zuNASFGwLT
 gakEKIoqgkl3q0WlBvLCnPUlr3rdYaTTM20HXg==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/10/2021 à 15:16, Laurent Vivier a écrit :
> This script is not used a lot but it helps to debug migration,
> so it's annoying when we need it and it doesn't work...
> 
> The first patch fix an error message that is erroneous and thus
> doesn't help at all.
> 
> The second fixes a problem introduced by python3 and preventing
> to run the extract mode.
> 
> Laurent Vivier (2):
>   analyze-migration.py: fix a long standing typo
>   analyze-migration.py: fix extract contents ('-x') errors
> 
>  scripts/analyze-migration.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

