Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4784E7460
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:43:11 +0100 (CET)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXkDe-0000OA-0y
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:43:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXkB8-0007ub-9Z
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXkB1-0006kf-8f
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648215624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/ODWplp8gzwsWgBSKhKG9qV3Azy7mFMsOhPBarZZ5Q=;
 b=ZUHNVck4p+xgBahvjEuet6XSZ9Zn3WbcuHNWSuT0mHK5qFfHB+a2UhYMHYfA58MTnlKrBW
 9a3hUjGLwA0VnohdZZVnb/Dj7VkuLxPB6eN7TvrHlqKJyAz69F5x4T9dvBgGMM2DP22cnz
 Rvsx1ptuXIrKgNS93ynU6YAjz15lBUs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3--zbL9GEeNp2VXu0cjXMtAA-1; Fri, 25 Mar 2022 09:40:23 -0400
X-MC-Unique: -zbL9GEeNp2VXu0cjXMtAA-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so4084938ejc.19
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 06:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l/ODWplp8gzwsWgBSKhKG9qV3Azy7mFMsOhPBarZZ5Q=;
 b=tRKEg4FDl/wYdgwHiivpf/cR1lLI19/NYeoa0EXAVHiADMOhSSoZuelmisA6MsYVb1
 8qcNAl8134Szcvd6cZ/yB5fljC4AZ7oORmmm2Oz3PM5N98ZMYT2UdoxWQ7DWOEP22srE
 En8P0vJt72dn9MtVjrYONR/8jwtGYF0fX5iL0FWeuCSK9vL+rQwaqMfu42OENZkOKuiC
 YXR04LZVMvIMDcB1CISxYw6h+ZIwPXe5mBPFzeVIjPUrqBoYckJnVyRMioBkjlGDF9iu
 K2MR4snr2JGLvZ5PW+vxI23rbPjGnZ5KEBAAcfzU3vqs7L/HkXwfGRga+oPVxdGhBrrU
 2qlA==
X-Gm-Message-State: AOAM530fUR2CNTrnDYWCaPk64yKeYkCCu7FT8MvOVJJg6F1szB8a3dcf
 ziWf46IvCf9nLJZhzM87kInZjT75uNSyfwQ3McgMo92YhUKxrdAztsUpB+l2m1s7WO6xNBFyJFp
 sbFq5i6Z635WdVRo=
X-Received: by 2002:aa7:cb8b:0:b0:410:9aaf:2974 with SMTP id
 r11-20020aa7cb8b000000b004109aaf2974mr13102237edt.173.1648215622044; 
 Fri, 25 Mar 2022 06:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXRACJqRkqk2AmA75KXAIqpIpzwaeo6zNCe3axg2oNS4vKZvVz7Y0F0+bcIIdLLsRcBymtJA==
X-Received: by 2002:aa7:cb8b:0:b0:410:9aaf:2974 with SMTP id
 r11-20020aa7cb8b000000b004109aaf2974mr13102215edt.173.1648215621742; 
 Fri, 25 Mar 2022 06:40:21 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1709063a0500b006da8fa9526esm2357571eje.178.2022.03.25.06.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 06:40:21 -0700 (PDT)
Message-ID: <4682fc7e-bfe5-1ab3-bc0f-650fd981ea2f@redhat.com>
Date: Fri, 25 Mar 2022 14:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/17] iotests/040: Fix TestCommitWithFilters test
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-6-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220324183018.2476551-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 24.03.22 19:30, John Snow wrote:
> Without this change, asserting that qemu_io always returns 0 causes this
> test to fail in a way we happened not to be catching previously:
>
>   qemu.utils.VerboseProcessError: Command
>    '('/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/../../qemu-io',
>    '--cache', 'writeback', '--aio', 'threads', '-f', 'qcow2', '-c',
>    'read -P 4 3M 1M',
>    '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img')'
>    returned non-zero exit status 1.
>    ┏━ output ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
>    ┃ qemu-io: can't open device
>    ┃ /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img:
>    ┃ Could not open backing file: Could not open backing file: Throttle
>    ┃ group 'tg' does not exist
>    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
>
> Explicitly provide the backing file so that opening the file outside of
> QEMU (Where we will not have throttle groups) will succeed.
>
> [Patch entirely written by Hanna but I don't have her S-o-B]

Er, well, not sure if this even meets the necessary threshold of 
originality, so a Proposed-by would’ve been fine.

Anyway, here you go:

Signed-off-by: Hanna Reitz <hreitz@redhat.com>

> [My commit message is probably also garbage, sorry]

I don’t find it too bad, but a paragraph describing the actual problem 
might improve it.  E.g. (below the exception output):

The commit jobs changes the backing file string stored in the image file 
header belonging to the node above the commit’s top node to point to the 
commit target (the base node).  QEMU tries to be as accurate as 
possible, and so in these test cases will include the filter that is 
part of the block graph in that backing file string (by virtue of making 
it a json:{} description of the post-commit subgraph).  This makes 
little sense outside of QEMU, though: Specifically, the throttle node in 
that subgraph will dearly miss its supposedly associated throttle group 
object.

When starting the commit job, we can specify a custom backing file 
string to write into said image file, so let’s use that feature to write 
the plain filename of the backing chain’s next actual image file there.

> [Feel free to suggest a better one]
> [I hope your day is going well]

Fridays tend to be on the better side of days.

Hanna

> Signed-off-by: John Snow <jsnow@redhat.com>
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/040 | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
> index c4a90937dc..30eb97829e 100755
> --- a/tests/qemu-iotests/040
> +++ b/tests/qemu-iotests/040
> @@ -836,7 +836,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):
>                                job_id='commit',
>                                device='top-filter',
>                                top_node='cow-2',
> -                             base_node='cow-1')
> +                             base_node='cow-1',
> +                             backing_file=self.img1)
>           self.assert_qmp(result, 'return', {})
>           self.wait_until_completed(drive='commit')
>   
> @@ -852,7 +853,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):
>                                job_id='commit',
>                                device='top-filter',
>                                top_node='cow-1',
> -                             base_node='cow-0')
> +                             base_node='cow-0',
> +                             backing_file=self.img0)
>           self.assert_qmp(result, 'return', {})
>           self.wait_until_completed(drive='commit')
>   


