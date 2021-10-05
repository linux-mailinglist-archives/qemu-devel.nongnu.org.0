Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5494220AD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:29:24 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfpD-0004j9-0u
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mXfiZ-0008SV-C4
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:22:31 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:44298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mXfiV-00025x-O1
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:22:31 -0400
Received: from [192.168.15.208] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id C024420779;
 Tue,  5 Oct 2021 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1633422144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/2WIvfJSlzz5sxUUx49r/UBjBCVSA3S7jTqLH7LqKA=;
 b=E//4jFkG+1cqmzPqW0Bn0celp3dMpCOlcyqj65xfws/ADQsU4Yb4WjU8TfA5kEvvJOCQhg
 GH73io6oSO5V2BQUDiTkm/RUjRQZKWrEI0pRA/sP75Z35fxA9QOUgzywM+qhlpcEIvC+vM
 6smGR1TyiuqTtMx7L8igupo8grKJMfA=
Message-ID: <6c3a8bc9-30b4-0b1f-f2ca-12502377f2fd@greensocs.com>
Date: Tue, 5 Oct 2021 10:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v4 2/3] docs: (further) remove non-reference uses of
 single backticks
Content-Language: en-US-large
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004215238.1523082-1-jsnow@redhat.com>
 <20211004215238.1523082-3-jsnow@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211004215238.1523082-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/4/21 23:52, John Snow wrote:
> The series rotted already. Here's the new changes.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

> ---
>   docs/system/i386/sgx.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/i386/sgx.rst b/docs/system/i386/sgx.rst
> index f103ae2a2fd..9aa161af1a1 100644
> --- a/docs/system/i386/sgx.rst
> +++ b/docs/system/i386/sgx.rst
> @@ -77,9 +77,9 @@ CPUID
>   
>   Due to its myriad dependencies, SGX is currently not listed as supported
>   in any of Qemu's built-in CPU configuration. To expose SGX (and SGX Launch
> -Control) to a guest, you must either use `-cpu host` to pass-through the
> +Control) to a guest, you must either use ``-cpu host`` to pass-through the
>   host CPU model, or explicitly enable SGX when using a built-in CPU model,
> -e.g. via `-cpu <model>,+sgx` or `-cpu <model>,+sgx,+sgxlc`.
> +e.g. via ``-cpu <model>,+sgx`` or ``-cpu <model>,+sgx,+sgxlc``.
>   
>   All SGX sub-features enumerated through CPUID, e.g. SGX2, MISCSELECT,
>   ATTRIBUTES, etc... can be restricted via CPUID flags. Be aware that enforcing
> @@ -126,7 +126,7 @@ creating VM with SGX.
>   Feature Control
>   ~~~~~~~~~~~~~~~
>   
> -Qemu SGX updates the `etc/msr_feature_control` fw_cfg entry to set the SGX
> +Qemu SGX updates the ``etc/msr_feature_control`` fw_cfg entry to set the SGX
>   (bit 18) and SGX LC (bit 17) flags based on their respective CPUID support,
>   i.e. existing guest firmware will automatically set SGX and SGX LC accordingly,
>   assuming said firmware supports fw_cfg.msr_feature_control.
> 

