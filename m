Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B369E089
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:38:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pURtP-0007Wr-N6; Tue, 21 Feb 2023 07:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pURtN-0007W0-C0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pURtL-0005Ec-Dd
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omJjEkATZV2rqXFy4+xsmQ1ba3uKUjXnHOoFRqru4C4=;
 b=VaBA4kXeYOhNL3t9LLYmlvl5Fj1d1SbZlL1XUnYxCbG7T6TwWIXMBotkbwPwpqrBw3S+da
 bvQrwn5+pEkdO2S9QBoEV2LK0FsBemgGDBVOBJTruVRFwWZISN5gROAcapAxakAhwyzVTT
 VZ7+JW9uDUu1hnCOS6ejzwJVF8JsjGk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-LuPPykhgNs2xnLB8hbrZLw-1; Tue, 21 Feb 2023 07:37:05 -0500
X-MC-Unique: LuPPykhgNs2xnLB8hbrZLw-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec13-20020a0564020d4d00b004a621e993a8so5561833edb.13
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 04:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=omJjEkATZV2rqXFy4+xsmQ1ba3uKUjXnHOoFRqru4C4=;
 b=qy85y+26SbsyrEuHJpqd5OPAyWgxuLuKMhlnxSnZsl/zp26XD0Q8198a9NUOmD5R8+
 rpDshlJ2ZLgKw2LPRZECu0hjD3eSSY3pDvGeI928hJq5oopUc2d75W7iMptBQMjr09L2
 2kO4qct5RcXTRaHYtpiJkAmDXlmj0rRpu5mIGiaLmn5QxG/Y6iGwuPAZ4j/8rSEyX1it
 IjoadPV1ME16RgH42ghRxCbwfYkhJZqKcSQuisbXMX1JlECArPtBm4EE3loBmFrcUdlM
 NNiT1/HTdy2NYZrzdVx8pQETb9Gu6KNYREo3yRibbUwP19jKeo36u1mSYfkTWlt7nxtC
 qrSA==
X-Gm-Message-State: AO0yUKWsZc4MA2z6SRGoG9aLqzMJPhMMvmP0e/aTa1EfoCkNMSOcB8bE
 7LUX0QVVxK95IfZan0vCqxs/FCM0nSx43bAkV8bIoxQAnYSHyOC2E1Z//S71+SFIYFs5wNVz7qT
 jZNEExX9oxJbDAaU=
X-Received: by 2002:a17:906:aac5:b0:8b1:7a83:1a33 with SMTP id
 kt5-20020a170906aac500b008b17a831a33mr13871366ejb.54.1676983023868; 
 Tue, 21 Feb 2023 04:37:03 -0800 (PST)
X-Google-Smtp-Source: AK7set977Y0kgLZagVb0nFkHhqTneWY8wuTibfpyiC7fxEkzkmNLjyDjWzS8KCBg7nX3lCPwaem13Q==
X-Received: by 2002:a17:906:aac5:b0:8b1:7a83:1a33 with SMTP id
 kt5-20020a170906aac500b008b17a831a33mr13871349ejb.54.1676983023580; 
 Tue, 21 Feb 2023 04:37:03 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 h27-20020a1709063c1b00b008de345f4f9asm938411ejg.49.2023.02.21.04.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 04:37:03 -0800 (PST)
Message-ID: <65e75828-9014-fa4e-7c2f-82e967e821c2@redhat.com>
Date: Tue, 21 Feb 2023 13:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/6] meson: prefer 'sphinx-build' to 'sphinx-build-3'
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-6-jsnow@redhat.com>
 <2c63f79d-b46d-841b-bed3-0dca33eab2c0@redhat.com>
In-Reply-To: <2c63f79d-b46d-841b-bed3-0dca33eab2c0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/21/23 12:31, Paolo Bonzini wrote:
> On 2/21/23 02:24, John Snow wrote:
>> Once upon a time, "sphinx-build" on certain RPM platforms invoked
>> specifically a Python 2.x version, while "sphinx-build-3" was a distro
>> shim for the Python 3.x version.
>>
>> These days, none of our supported platforms utilize a 2.x version, so it
>> should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
>> which will prefer pip/venv installed versions of sphinx if they're
>> available.
>>
>> This adds an extremely convenient ability to test document building
>> ability in QEMU across multiple versions of Sphinx for the purposes of
>> compatibility testing.
> 
> Can we just use "$PYTHON -m sphinx.cmd.build" instead, to ensure that we 
> don't
> escape the virtual environment?  Or even better, we could have a simple 
> script
> like this:
> 
> #! /usr/bin/env python3
> 
> from pkg_resources import load_entry_point
> 
> if __name__ == '__main__':
>      if sys.argv[1] == '--check':
>          try:
>              load_entry_point(sys.argv[2], 'console_scripts', sys.argv[3])
>              sys.exit(0)
>          except ImportError:
>              sys.exit(1)
>      else:
>          entry_point = load_entry_point(sys.argv[1], 'console_scripts', 
> sys.argv[2])
>          # The second argument to python-run.py becomes sys.argv[0]
>          del sys.argv[0:1]
>          sys.exit(entry_point())
> 
> then docs/meson.build can do this:
> 
> python_run = find_program('scripts/python-run.py')
> build_docs = false
> if get_feature('docs') \
>    .require(run_command(python_run, '--check', 'sphinx', 'sphinx-build',
>                         check: false).returncode() == 0,
>             error: 'Could not find sphinx installation') \
>    .allowed()
>    # The sphinx module is installed
>    SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir,
>                   python_run, 'sphinx', 'sphinx-build', '-q']
>    ...
>    build_docs = (sphinx_build_test_out.returncode() == 0)
>    ...
> endif
> 
> This again ensures that sphinx-build will not escape the virtual 
> environment
> if there is one.  configure can also use the script to run meson, though 
> that
> can come later.

Ok, it's a bit harder but it works.  Patch coming later today.

Paolo


