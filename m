Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45304589B3A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:52:48 +0200 (CEST)
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZPD-0005VG-9Q
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJZKN-0000lq-2r; Thu, 04 Aug 2022 07:47:47 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:36857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJZKL-0003CS-FC; Thu, 04 Aug 2022 07:47:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MRk8w-1nqSve3aGI-00TGKM; Thu, 04 Aug 2022 13:47:41 +0200
Message-ID: <8730b368-6ca7-6ae1-61b0-2f86ed05083e@vivier.eu>
Date: Thu, 4 Aug 2022 13:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] docs/about/removed-features: Move the -soundhw into the
 right section
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kraxel@redhat.com, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20220802075611.346835-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220802075611.346835-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:65rk9GhZ8wWdrWyrLgdHFDx6GnqOAZmfj9IsZ1lS+xK+U9nN+jC
 putsRZClsooBoeNZTG9MhgDzSdI4MoVz7TindESAfKQU7d3q7RDh2bXoxfc417BPO0oldwo
 GTRuIKNnDeKiasqJGVKmsU22d3UW4KtxoPEQ4gID2agk5ajeFQyCtOjxKl+ce7ok21qAzfy
 hUhXJClJM8YIhxcUOrFkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qZrhiYkDPvk=:VHwa/CWIHVfXUOG0zFA9Fu
 6fcQKxyMFZmDgwhyTBhUYM4dsK8sF4wghQh0geVgypeyTPgTt804J6TbvQOeKB6zcGt3N25Db
 DFVcNoCA4G4C91+49Iq52DCI5bxpZFRKUbLAIR8I++RQaiw4Sa8ZXKM6OJSen4jecsmMl7AED
 2zBGxZYmcG0EmtnoOA100k2R/rWQr4lNW7k4ymbb8Vy/ICOdtGj9t+grCv5SnlFU8Fi4KiHIr
 xbdBYAlW7gP0HQSUkb4UwFSLnv2IFaTpHduZgPiUgCJmfKbne8pR7NRpkvoVlQ4tg18WEcO0E
 ZHZSsL8nUOfdwP6FMiZA1Rw1NY3oXOcJHJr3Ih1R8TmxzBGUY5oDDcV6pT6FkoTxIzS7b4Bn4
 l7Fc5sF8hQFnGSVd/C4gt8C9/pGHGk8JUMvqtH4dcZBjsWx9YeLrx4yV4LMqBtgYqwqq/AU4S
 NU6LM4Cn1w4ifL8Q3XewYUPJV4l0azGTKwvJZ8V9J7zRFStWhmqbAgFRubjJDaRW9/6XbF0RU
 YlfdpPc8jYlhg8s8sDUP5kNZpZa6/t3DApF6OBBeYyWZCz89GbQtiAOz8WJ577A+S1324VBOY
 FoHdbh6vyZvLea/mPCMC5Q1ZHIFGOxdUt5YGCp+IFXAkHQdaQyZLR/RhCAKll2hbU0bHUOuad
 daQv3Zqvz3wcl4JI+ec9xI9IosK9ubNFjh+ghPWxN9C7rnS0fg0nJX8qHnPCL9SdobGOpJhPA
 SQqJ8C6Dr9GbJ27ogEqK5bvKkfZITUnaIov1zw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 02/08/2022 à 09:56, Thomas Huth a écrit :
> The note about the removal of '-soundhw' has been accidentally added
> to the section of removed "linux-user mode CPUs" ... it should reside
> in the section about removed "System emulator command line arguments"
> instead.
> 
> Fixes: 039a68373c ("introduce -audio as a replacement for -soundhw")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/removed-features.rst | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index c7b9dadd5d..925e22016f 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -396,6 +396,13 @@ Use ``-display sdl`` instead.
>   
>   Use ``-display curses`` instead.
>   
> +Creating sound card devices using ``-soundhw`` (removed in 7.1)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Sound card devices should be created using ``-device`` or ``-audio``.
> +The exception is ``pcspk`` which can be activated using ``-machine
> +pcspk-audiodev=<name>``.
> +
>   
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
> @@ -681,13 +688,6 @@ tripped up the CI testing and was suspected to be quite broken. For that
>   reason the maintainers strongly suspected no one actually used it.
>   
>   
> -Creating sound card devices using ``-soundhw`` (removed in 7.1)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Sound card devices should be created using ``-device`` or ``-audio``.
> -The exception is ``pcspk`` which can be activated using ``-machine
> -pcspk-audiodev=<name>``.
> -
>   TCG introspection features
>   --------------------------
>   

Applied to my trivial-patches branch.

Thanks,
Laurent


