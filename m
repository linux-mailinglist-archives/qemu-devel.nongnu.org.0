Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D930AC4A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:07:59 +0100 (CET)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bk6-0005SP-H8
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6bi0-0003Qi-G1; Mon, 01 Feb 2021 11:05:49 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:13367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6bhx-0006hl-5p; Mon, 01 Feb 2021 11:05:47 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9B6A37462DB;
 Mon,  1 Feb 2021 17:05:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6646F7462BD; Mon,  1 Feb 2021 17:05:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 644B67456B4;
 Mon,  1 Feb 2021 17:05:38 +0100 (CET)
Date: Mon, 1 Feb 2021 17:05:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
In-Reply-To: <20210201154703.180022-11-stefanha@redhat.com>
Message-ID: <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-590698333-1612195538=:91053"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-590698333-1612195538=:91053
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 1 Feb 2021, Stefan Hajnoczi wrote:
> It is possible to repeat the --trace option to specify multiple
> patterns. This may be preferrable to users who do not want to create a
> file with a list of patterns.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-id: 20210112165859.225534-2-stefanha@redhat.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> docs/devel/tracing.rst | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> index af395e957d..e8f9b82c5e 100644
> --- a/docs/devel/tracing.rst
> +++ b/docs/devel/tracing.rst
> @@ -22,10 +22,15 @@ events::
> This output comes from the "log" trace backend that is enabled by default when
> ``./configure --enable-trace-backends=BACKENDS`` was not explicitly specified.
> 
> -More than one trace event pattern can be specified by providing a file
> -instead::
> +Multiple patterns can be specified by repeating the ``--trace`` option::
> +
> +    $ qemu --trace "kvm_*" --trace "virtio_*" ...

Does that actually work? I've always used -trace enable="pattern1" -trace 
enable="pattern2" Not sure if omitting enable= is the same.

Regards,
BALATON Zoltan

> +
> +When patterns are used frequently it is more convenient to store them in a
> +file to avoid long command-line options::
>
>     $ echo "memory_region_ops_*" >/tmp/events
> +    $ echo "kvm_*" >>/tmp/events
>     $ qemu --trace events=/tmp/events ...
> 
> Trace events
> -- 
> 2.29.2
--3866299591-590698333-1612195538=:91053--

