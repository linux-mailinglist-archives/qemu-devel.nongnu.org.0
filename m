Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32346447C84
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:07:09 +0100 (CET)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0cK-00062Q-TE
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk0YW-0008BW-7s
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:03:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk0YF-0002NJ-Sh
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4aWU5Ba5lUfd+dkNheb9u/rQNWR73rDD3uVl/ODVAs=;
 b=QLCBUvQEIxirlxFnjkzeJn5r6+InfW7yCA3dFkQyv1UPNlrLNWzRKWLBEkrJfwjrZQJRgf
 I82yS+2FyHu9M/x9zhhZVh51Cuucf96q261fdMW7CG5dmQBIdmq/YU/n5WquL5MTClQ371
 i1EDgtKLz/EY+kRGjjoI3wE9SUY/pp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-iBHG38SWMzyRBk6sUzAc4A-1; Mon, 08 Nov 2021 04:02:49 -0500
X-MC-Unique: iBHG38SWMzyRBk6sUzAc4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 725F718D6A25
 for <qemu-devel@nongnu.org>; Mon,  8 Nov 2021 09:02:48 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 986705F4ED;
 Mon,  8 Nov 2021 09:02:47 +0000 (UTC)
Message-ID: <e03ca933-c516-3a23-36c0-d084f04332e9@redhat.com>
Date: Mon, 8 Nov 2021 10:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] configure: simplify calls to meson_quote
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211108084323.541961-1-pbonzini@redhat.com>
 <20211108084323.541961-2-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211108084323.541961-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 08/11/2021 09.43, Paolo Bonzini wrote:
> meson_quote assumes a non-empty argument list, and incorrectly returns a
> one-entry array if passed nothing.  Move the check for an empty argument
> list from the invocations to the function itself.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/configure b/configure
> index 33682cb971..369b5455b6 100755
> --- a/configure
> +++ b/configure
> @@ -3894,6 +3894,7 @@ echo "TOPSRC_DIR=$source_path" >> $config_mak
>   if test "$skip_meson" = no; then
>     cross="config-meson.cross.new"
>     meson_quote() {
> +    test $# = 0 && return
>       echo "'$(echo $* | sed "s/ /','/g")'"
>     }
>   
> @@ -3908,10 +3909,10 @@ if test "$skip_meson" = no; then
>   
>     test -z "$cxx" && echo "link_language = 'c'" >> $cross
>     echo "[built-in options]" >> $cross
> -  echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
> -  echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS)}]" >> $cross
> -  echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
> -  echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
> +  echo "c_args = [$(meson_quote $CFLAGS)]" >> $cross
> +  echo "cpp_args = [$(meson_quote $CXXFLAGS)]" >> $cross
> +  echo "c_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
> +  echo "cpp_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
>     echo "[binaries]" >> $cross
>     echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
>     test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


