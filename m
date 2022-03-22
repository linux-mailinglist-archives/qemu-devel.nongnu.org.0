Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1EF4E427F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:06:13 +0100 (CET)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWg5M-0003hS-5O
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:06:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWg3O-0002Ip-TM
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWg3L-0003OM-Pi
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647961446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2+bd3YslzxCVRN0spwqEC40gXgC4wbUYP+RU4jr/zs=;
 b=eYPSGwVHWdlNBa2HJ6g65FVAJ0s+cl2BYmjojNHiAJpUKu6z7ylCau5T+riusd+ayTBLIm
 2eAffNj5GvJX0fwo5QP+jvHM/dt1rZLOZqYBORDgER7a8jLP6fz9MKIVuojKBqcTVQTjjc
 Iuw1iBJ3D3KqSGib6W4ZGUd1bixQY7g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-pNoJVs-IMf6w7OMLcLZa7w-1; Tue, 22 Mar 2022 11:04:05 -0400
X-MC-Unique: pNoJVs-IMf6w7OMLcLZa7w-1
Received: by mail-ed1-f70.google.com with SMTP id
 q25-20020a50aa99000000b004192a64d410so4465226edc.16
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L2+bd3YslzxCVRN0spwqEC40gXgC4wbUYP+RU4jr/zs=;
 b=HDwu0vugEXpOOyi7cEBTqCwW4cP53a8UbmH80Vtp/bvPB5UjaUvZKVpzqm9gc/LmzB
 ISp0IZ6HR12oqWWJgy7RgKZ/qO7EHKvtQqAYH5I1/oYM34HTSfBwy4JLyNSXzVa7FGA2
 oIwx5UphSCiIPq2KFUbrtFGUck/oMcvvke5fYUlTuHfcVZt9gSsNVSRRJCRLDFyWHMn7
 q+aFdBhbwwrf4XCsHalY6tyt0uX4bWSuQJjTeGThVGa8SLsyfqm5aSwFiA+HA/Bg6MJI
 G/iVqKp3yPNMlThMe2l7+FSBfnTfWDtSMrGNjmjkedIKGs9SG7sipZL1eKD3nQGvfJFh
 VO1A==
X-Gm-Message-State: AOAM532o5q1vGQwnq+VXuvkJR/rpGe87TaJ7e7Y3/PdWS4L/2z9UPYcd
 LaBIChXcFiqb/9xkt+CcncfWAufI8A182+BK0EyrBZCwH8B9TvnEm9dHMa+9odAWLe0JbiATc5p
 h6Iz5XVAZ6N/Xe9o=
X-Received: by 2002:a17:907:1628:b0:6d0:ae1c:251b with SMTP id
 hb40-20020a170907162800b006d0ae1c251bmr26300365ejc.393.1647961444270; 
 Tue, 22 Mar 2022 08:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz83XUkKv3QZR/OP0fgnzqOrzNGJ2IYMVvttyZ92dxizpnRNvDnqkaEjWZuMJtPLZP0Q9fcuA==
X-Received: by 2002:a17:907:1628:b0:6d0:ae1c:251b with SMTP id
 hb40-20020a170907162800b006d0ae1c251bmr26300330ejc.393.1647961443924; 
 Tue, 22 Mar 2022 08:04:03 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a056402254700b0041967ac94cbsm3995edb.7.2022.03.22.08.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 08:04:03 -0700 (PDT)
Message-ID: <d89a365d-161b-e7bb-e5a0-80418e60d063@redhat.com>
Date: Tue, 22 Mar 2022 16:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/15] iotests: rebase qemu_io() on top of qemu_tool()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> Rework qemu_io() to be analogous to qemu_img(); a function that requires
> a return code of zero by default unless disabled explicitly.
>
> Tests that use qemu_io():
> 030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 205
> 209 219 236 245 248 254 255 257 260 264 280 298 300 302 304
> image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test
> migrate-during-backup migration-permissions
>
> Test that use qemu_io_log():
> 242 245 255 274 303 307 nbd-reconnect-on-open
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> Note: This breaks several tests at this point. I'll be fixing each
> broken test one by one in the subsequent commits. We can squash them all
> on merge to avoid test regressions.

Well, absolutely.

> (Seems like a way to have your cake and eat it too with regards to
> maintaining bisectability while also having nice mailing list patches.)

I personally find reviewability to not be affected whether this is one 
patch or multiple, given that the changes are in different files anyway.

I am afraid someone might forgot to squash when merging this series, 
though...

Also, I don’t know how to squash R-b tags, and I don’t feel like I can 
give an R-b for a patch that decidedly breaks tests.

>
> Copy-pastables:
>
> ./check -qcow2 030 040 041 044 055 056 124 129 132 151 152 163 165 209 \
>                 219 236 242 245 248 254 255 257 260 264 274 \
>                 280 298 300 302 303 304 307 image-fleecing \
>                 migrate-bitmaps-postcopy-test migrate-bitmaps-test \
>                 migrate-during-backup nbd-reconnect-on-open
>
> ./check -raw 093 136 148 migration-permissions
>
> ./check -nbd 205
>
> # ./configure configure --disable-gnutls --enable-gcrypt
> # this ALSO requires passwordless sudo.
> ./check -luks 149
>
>
> # Just the ones that fail:
> ./check -qcow2 030 040 242 245
> ./check -raw migration-permissions
> ./check -nbd 205
> ./check -luks 149
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 974a2b0c8d..58ea766568 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -354,16 +354,23 @@ def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
>   def qemu_io_popen(*args):
>       return qemu_tool_popen(qemu_io_wrap_args(args))
>   
> -def qemu_io(*args):
> -    '''Run qemu-io and return the stdout data'''
> -    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
> +def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
> +            ) -> subprocess.CompletedProcess[str]:

I guess this return type probably has to be quoted.

> +    """
> +    Run QEMU_IO_PROG and return the status code and console output.
> +
> +    This function always prepends either QEMU_IO_OPTIONS or
> +    QEMU_IO_OPTIONS_NO_FMT.
> +    """
> +    return qemu_tool(*qemu_io_wrap_args(args),
> +                     check=check, combine_stdio=combine_stdio)
>   
>   def qemu_io_pipe_and_status(*args):
>       return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
>   
> -def qemu_io_log(*args):
> -    result = qemu_io(*args)
> -    log(result, filters=[filter_testfiles, filter_qemu_io])
> +def qemu_io_log(*args: str) -> subprocess.CompletedProcess[str]:

...and this one.

Hanna

> +    result = qemu_io(*args, check=False)
> +    log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
>       return result
>   
>   def qemu_io_silent(*args):


