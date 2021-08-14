Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5702E3EC0F6
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:42:46 +0200 (CEST)
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEnNU-0004lA-Uo
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEnMT-00045Q-CX
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:41:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEnMQ-0005u4-02
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628923295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/cLkZThicwxG3TBQOkLjkwVpGrECF1EntPfgDpyNJc=;
 b=DN8blwoWgmbiR95dI/pzuaLz1/45F0i00NuH9+be4mBpkLrDZXM1UCEo452z3aqteA3ED+
 hqKEznPhN+GRxITHko1OWOYRxj1Ai1pq7Z0Pw0M0UQpqRLPtXuq5N7bM0L3PO5jziAwqWY
 80N6RTi3gRXx/hhzZsbL4sVXMJ166Rg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-SdHgVfClP8q-JYreBR0EcQ-1; Sat, 14 Aug 2021 02:41:34 -0400
X-MC-Unique: SdHgVfClP8q-JYreBR0EcQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 y186-20020a1c32c30000b02902b5ac887cfcso5674212wmy.2
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 23:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A/cLkZThicwxG3TBQOkLjkwVpGrECF1EntPfgDpyNJc=;
 b=H0z7nLe4QWaXS3UBXRirUcOQKSQ1NIZrtsZ8f1xPj2/lqfchw/JX3OF3mQKeQmlgsw
 PF+kFzAkpDZZdUVpaAIPB8Ab7LYr3giJCw5ryL8XwgMz/nzzlQSDOZlSA+kLuweWGASb
 J+BQTdTp4SUHlGN7eYPpkrJRsqp9j9fa9GbbTx7y+p2UuMYfaFOTY81wCws5Alg1dLUx
 WgPF85mM5SV7d6QV9O74o05lT4B1Dr2pM4yi10/bx03cJxK89fgFfLTn9wdHlrWstW44
 QYYMuX4TmeQHH/Ezb5P/xH7cLnToEtE0WHezVWI+oBNAbYgWEdeD8XTzs18MQmt90oie
 t3lg==
X-Gm-Message-State: AOAM532UiIINDL+XFS8vFA47DEyU+JmifQhL8RQL+7yjP1OK22cOkrcC
 /wo6VUrv914HFwxJykOiz18I3i1QKm0mBt/trexDsTgfrbGPfKEG7ZKhnyimebNBqbh86te2giv
 D9FzvyX77qSlZviM=
X-Received: by 2002:a1c:4c:: with SMTP id 73mr5834774wma.139.1628923293392;
 Fri, 13 Aug 2021 23:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFBLLkrqgTFncWaCj9cwPYAHcK+Jh16Z94enbMALRT06MUkvVvCUTAnVHgTvbcBL+7cIIcSA==
X-Received: by 2002:a1c:4c:: with SMTP id 73mr5834761wma.139.1628923293196;
 Fri, 13 Aug 2021 23:41:33 -0700 (PDT)
Received: from thuth.remote.csb (pd95757ea.dip0.t-ipconnect.de.
 [217.87.87.234])
 by smtp.gmail.com with ESMTPSA id z19sm3934977wma.0.2021.08.13.23.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 23:41:32 -0700 (PDT)
Subject: Re: [PATCH for-6.2 3/4] tests/qtest/ipmi-bt-test: Zero-initialize
 sockaddr struct
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210813150506.7768-1-peter.maydell@linaro.org>
 <20210813150506.7768-4-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <05e79bf7-ebae-53d0-d3e7-ac50e8974ab7@redhat.com>
Date: Sat, 14 Aug 2021 08:41:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210813150506.7768-4-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Corey Minyard <minyard@acm.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/08/2021 17.05, Peter Maydell wrote:
> Zero-initialize the sockaddr_in struct that we're about to fill in
> and pass to bind(), to ensure we don't leave possible
> implementation-defined extension fields as uninitialized garbage.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/ipmi-bt-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
> index 8492f02a9c3..19612e9405a 100644
> --- a/tests/qtest/ipmi-bt-test.c
> +++ b/tests/qtest/ipmi-bt-test.c
> @@ -378,7 +378,7 @@ static void test_enable_irq(void)
>    */
>   static void open_socket(void)
>   {
> -    struct sockaddr_in myaddr;
> +    struct sockaddr_in myaddr = {};
>       socklen_t addrlen;
>   
>       myaddr.sin_family = AF_INET;
> 

Acked-by: Thomas Huth <thuth@redhat.com>


