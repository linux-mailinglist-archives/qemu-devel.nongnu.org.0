Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4112FD5C5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:36:36 +0100 (CET)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GTD-0006PY-An
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2GQ7-0004tA-GC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2GQ2-0000og-6R
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611160395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpy2sFVTv0nbCCJ6fS2nHGKUHVRE2gjehOt9amvysOs=;
 b=Ccy84fl5p7OGLCiAURC+I5v4tJrrxPQJpQOhq/LrnvgB+eHksEgKAAT/GgftLUpQdlp8E7
 oM8LKWu4YcqdXRjF7fuBfHjCGFZ1MiIU4vqjlwIqfe4IsiCSxRDRcdB9FxMki2ziBGwVcI
 KuoVRHxfCQ+FtVq8WTtC8GrOSSswZRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-z76p-WInNO-i1apef6CRsQ-1; Wed, 20 Jan 2021 11:33:13 -0500
X-MC-Unique: z76p-WInNO-i1apef6CRsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24ADC1005504
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 16:33:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B110072160
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 16:33:10 +0000 (UTC)
Subject: Re: [PATCH 3/3] configure: Emit warning when accelerator requested
 but not needed
To: qemu-devel@nongnu.org
References: <20210120151916.1167448-1-philmd@redhat.com>
 <20210120151916.1167448-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bdaa5334-873c-b225-ef6c-1664c4d6218f@redhat.com>
Date: Wed, 20 Jan 2021 17:33:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120151916.1167448-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/2021 16.19, Philippe Mathieu-Daudé wrote:
> In some configurations it might be pointless to check and
> compile accelerator code. Do not deselect the accelerator,
> but emit a warning.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   configure | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/configure b/configure
> index a5159157a49..09e1cd8bfe6 100755
> --- a/configure
> +++ b/configure
> @@ -5514,6 +5514,27 @@ if test $git_update = 'yes' ; then
>       (cd "${source_path}" && GIT="$git" "./scripts/git-submodule.sh" update "$git_submodules")
>   fi
>   
> +if [ "$softmmu" = "no" ]; then
> +    if [ "$tcg" = "enabled" ]; then
> +        echo "WARN: TCG accelerator selected but no target requires it"
> +    fi

What about linux-user? It needs TCG, but it can also be compiled with 
softmmu disabled, can't it?

  Thomas


