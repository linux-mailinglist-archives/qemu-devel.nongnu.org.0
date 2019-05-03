Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A39E12C8F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 13:40:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMWYO-0002Op-ME
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 07:40:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWGy-0002OH-N3
	for qemu-devel@nongnu.org; Fri, 03 May 2019 07:22:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWGw-0005cs-J8
	for qemu-devel@nongnu.org; Fri, 03 May 2019 07:22:36 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50957)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWGq-0005Qa-Bt; Fri, 03 May 2019 07:22:29 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1My3Mv-1gXsYg3Qtz-00zWM0; Fri, 03 May 2019 13:22:18 +0200
To: qemu-devel@nongnu.org
References: <20190503111958.30825-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ae6af5a5-e007-c7b3-4d52-e40a1b5ce9bd@vivier.eu>
Date: Fri, 3 May 2019 13:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190503111958.30825-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:spxBM8O8aXQNUOAemCKjjQt+pPdTAS+JI3VwDpTW39J4cGiciGL
	feNN4FnkTvDFD2xkMCu8WOTfqw368rm0wiexh470hivYVq7zcRZqFyduD//wNUVgOnnZe/S
	a5SL2bY2sFYnCCov8kPbJCtuy9WJMTnVllSAywDE3+F7rbxTKXfQPIhHa26/OMx4A8MsFP0
	/Ej0GDXUrZBB27+waNyYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ekvgk/YOvSA=:dL+BVddG8UTHr6LWgnGUqm
	bFTuqdF1hkNZj0lgYs4a7cmOC7+YAUhrHJ8H3UMspB1ryAjsgrh/M3JllUQaMp4bnj2tzE9ID
	nWcwifRGq6TRQfhATpm9xwTwTmwClASWh3PBU+xEj2ir98ZZxzI2k+B7T3HryWuu6kzAjA5MP
	25fV+Erizp4d27RuxBPSb2mxB9ICSFXj7CIMbKbV8amgifz1hHDn7AS7Z5kCJKS69QggSY00n
	2ClD6kpIM0kbTnr4PH4rDNnBmzk3AWqPbszUEuK1PMDznw20YcHhFWnnvo/yqdU8FfVUaIHl/
	z0fm29KBYYFKt5ynYLvSDOMVUsDh+wUvmgNtaz2o4DkStoOAQ0/YrghxuE0rgBWkX3PiD2/bu
	UCYyD+1/RhtlLRPsvX9PgnDhPYjomtP4xlGV/GSoxvnKwpxDGzu5D/UW6oJx6cp9TtqspvAnq
	NGyG4erDnQEeC/LnzuSyVMh+Infk4F7j1GffgQ8SN3uI2DbEBI4sN/sxQJ0vIGbb4FEXlsVOJ
	fXG9l0YDUPMwUT6fZri0tQJMF+ChUW6tIZMfPOD8k+KW4hLV6rYrXxJ3OvhHJL07vXdxkQlGe
	7SHeD2vJibtSNxColHesYLcPQnxoY9CE3LlaSW8aP1WFUxDXoedOd6zQE28Ie7apVYWXQd7bD
	KTxu9lUflGa7GpO+kF+s2GtZvKIeaAJhpXsepiwt70ioOK/hi0UE+Cx8XdpLhQDs6/3GivkKx
	/E4ji4ioWqXV1tmNsk+eIx2oGZa8YxEtyW8m0jvvYW10Fn3OJQ/f5IWFo/g=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-devel] [PULL v2 00/12] Trivial branch patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Fabien Chouteau <chouteau@adacore.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2019 13:19, Laurent Vivier wrote:
> The following changes since commit 8482ff2eb3bb95020eb2f370a9b3ea26511e41df:
> 
>   Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-request' into staging (2019-05-02 12:04:51 +0100)
> 
> are available in the Git repository at:
> 
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
> 
> for you to fetch changes up to 2d2023c3b99edb33ad4bb9791f70456ea1a1c049:
> 
>   sockets: avoid string truncation warnings when copying UNIX path (2019-05-03 13:03:04 +0200)
> 
> ----------------------------------------------------------------
> Pull request trivial branch 2019-05-03
> 
> ----------------------------------------------------------------
> 
> Aruna Jayasena (1):
>   Header cleanups
> 
> Daniel P. Berrangé (1):
>   sockets: avoid string truncation warnings when copying UNIX path
> 
> Dr. David Alan Gilbert (1):
>   configure: fix pam test warning
> 
> Marc-André Lureau (1):
>   doc: fix the configuration path
> 
> Philippe Mathieu-Daudé (3):
>   hw/net/pcnet: Use qemu_log_mask(GUEST_ERROR) instead of printf
>   Makefile: Let the 'clean' rule remove qemu-ga.exe on Windows hosts
>   hw/sparc/leon3: Allow load of uImage firmwares
> 
> Stefan Weil (1):
>   Update configure
> 
> Thomas Huth (1):
>   net: Print output of "-net nic, model=help" to stdout instead of
>     stderr
> 
> Wei Yang (3):
>   CODING_STYLE: specify the indent rule for multiline code
>   CODING_STYLE: indent example code as all others
>   qom: use object_new_with_type in object_new_with_propv
> 
>  qemu-ga.texi              |  4 ++--
>  configure                 |  5 ++---
>  Makefile                  | 11 +++++----
>  include/exec/cpu-common.h |  3 ---
>  hw/net/pcnet.c            |  4 +++-
>  hw/sparc/leon3.c          |  4 ++++
>  net/net.c                 |  7 +++---
>  qom/object.c              |  2 +-
>  util/qemu-sockets.c       | 12 ++++++----
>  CODING_STYLE              | 47 +++++++++++++++++++++++++++++++++++----
>  10 files changed, 74 insertions(+), 25 deletions(-)
> 


Forget this series, the send has been aborted for an unknown reason.

Thanks,
Laurent


