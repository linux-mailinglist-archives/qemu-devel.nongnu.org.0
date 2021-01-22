Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0E3001AF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:36:02 +0100 (CET)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ujR-0007UX-QQ
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2uhK-0006eM-Th
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:33:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2uhJ-00035E-AE
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611315228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8SvrADUm23bDFqNU5UCAFcyRWqhbRUcsXH4ouQxuE4=;
 b=JMaKM/TbE+PGzDBQZ0pQSCY+gnpjvcmG3V0EB60jzz/Dcq/rI7tdKntV+O5FaMJ5gAQyhe
 VgckEt2HGh21lbU9DJWro/9V14zf0b0OuQ0WNaemQPvqzZ4jh/PRliwRorwLJo/yL8bpOZ
 xdhj1obra1dx6B4wzU71FFrrE+UhIOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-cHBLJqx3ODq9kMAzpYgjrA-1; Fri, 22 Jan 2021 06:33:46 -0500
X-MC-Unique: cHBLJqx3ODq9kMAzpYgjrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA0FF10054FF;
 Fri, 22 Jan 2021 11:33:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-109.ams2.redhat.com [10.36.112.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB7017047D;
 Fri, 22 Jan 2021 11:33:37 +0000 (UTC)
Subject: Re: [RFC PATCH v2 4/4] configure: Reword --enable-tcg-interpreter as
 --disable-native-tcg
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122105836.1878506-1-philmd@redhat.com>
 <20210122105836.1878506-5-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d8dbe17b-92f4-89b7-de75-36c3c9e1cde6@redhat.com>
Date: Fri, 22 Jan 2021 12:33:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122105836.1878506-5-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/2021 11.58, Philippe Mathieu-Daudé wrote:
> Users might want to enable all features, without realizing some
> features have negative effect. Rename '--enable-tcg-interpreter'
> as '--disable-native-tcg' to avoid user selecting this feature
> without understanding it. '--enable-tcg-interpreter' is kept in
> for backward compability with scripts.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> RFC so it can be discarded from the series
> 
>   configure | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 71bdc523aa0..5e56fa76499 100755
> --- a/configure
> +++ b/configure
> @@ -1121,7 +1121,8 @@ for opt do
>     ;;
>     --disable-tcg-interpreter) tcg_interpreter="no"
>     ;;
> -  --enable-tcg-interpreter) tcg_interpreter="yes"
> +  --enable-tcg-interpreter) # backward compatibility
> +  --disable-native-tcg) tcg_interpreter="yes"
>     ;;
>     --disable-cap-ng)  cap_ng="disabled"
>     ;;
> @@ -1753,7 +1754,7 @@ Advanced options (experts only):
>     --with-trace-file=NAME   Full PATH,NAME of file to store traces
>                              Default:trace-<pid>
>     --disable-slirp          disable SLIRP userspace network connectivity
> -  --enable-tcg-interpreter enable TCG with bytecode interpreter (experimental and slow)
> +  --disable-native-tcg     enable TCG with bytecode interpreter (experimental and slow)

The more I think about it, the more I like the idea.

Reviewed-by: Thomas Huth <thuth@redhat.com>


