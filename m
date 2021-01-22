Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9739C3001A5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:34:28 +0100 (CET)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uhv-0006bs-4g
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2ugc-0005yB-Ni
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:33:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2ugZ-0002jm-Vd
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611315182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sj5la1V5nAmlmw9NNf7hY4mLBIxzn6UnSqKgeDUmNzA=;
 b=XHPPxb0LbXpqu1VG/Wew4AZ5vy9FI4fgpJ41F8XZUZqY4FpJJdOrIfqOxKlebQshF0RAyZ
 uM/ulKD8OAbt+3ck4/vXrwitRfL9X97crUsrUK+q3LZf7L4/6gIAHb9ZJNRTwYewNpKQIM
 Ps17sENkvhfn8n8C2rfMHZoaPx1G0Ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170--w2FFzaCNKW2ysTV17HcTg-1; Fri, 22 Jan 2021 06:33:00 -0500
X-MC-Unique: -w2FFzaCNKW2ysTV17HcTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BC4107ACE3;
 Fri, 22 Jan 2021 11:32:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-109.ams2.redhat.com [10.36.112.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E28310021AA;
 Fri, 22 Jan 2021 11:32:57 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] configure: Improve TCI feature description
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122105836.1878506-1-philmd@redhat.com>
 <20210122105836.1878506-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fc2847c8-d897-aad1-0b00-1f6b3b1211a2@redhat.com>
Date: Fri, 22 Jan 2021 12:32:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122105836.1878506-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
> features have negative effect. Mention the TCI feature is slow
> and experimental, hoping it will be selected knowingly.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 9f016b06b54..71bdc523aa0 100755
> --- a/configure
> +++ b/configure
> @@ -1753,7 +1753,7 @@ Advanced options (experts only):
>     --with-trace-file=NAME   Full PATH,NAME of file to store traces
>                              Default:trace-<pid>
>     --disable-slirp          disable SLIRP userspace network connectivity
> -  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
> +  --enable-tcg-interpreter enable TCG with bytecode interpreter (experimental and slow)

I'd prefer if we could keep the "TCI" in there ... I remember having grep'ed 
for "tci" in the help output in the past, so I think it would be good to 
keep the TLA here. Maybe just put "TCI, slow" in the parantheses and omit 
"experimental"?

  Thomas


