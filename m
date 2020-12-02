Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A802CBF8E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:27:27 +0100 (CET)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkT6M-0006Of-Rp
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkT50-0004Tu-OE
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkT4y-0003gV-Ow
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606919159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=maj5xU3uqRtLNi69vgyX/3lAyCHGZpuY3El6f595k4w=;
 b=crmylg08SGMcLxeqrGY3PA2v9hIgSKpQ0WnoQ3KUu4Xe+wRFYd+w23g6gvVTroxbwLVwPN
 kBdc+j3C+obHBw0qk6OzAmL/NPKl7k4WI1NXXU6/jD+yq6BrtyH9I3oeUN4vOCb8BRyvBJ
 WdlauKtPVlR2DvAnSLaYpS7RSqcwlMk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-AD3gR1X8OpyMHvAvEJrqcw-1; Wed, 02 Dec 2020 09:25:53 -0500
X-MC-Unique: AD3gR1X8OpyMHvAvEJrqcw-1
Received: by mail-wr1-f72.google.com with SMTP id b1so4213831wrc.14
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 06:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=maj5xU3uqRtLNi69vgyX/3lAyCHGZpuY3El6f595k4w=;
 b=PrXehpeNAAWOzXc1l4K4Y4Cn73J//VWSfxHYxudeFTdOkE4o6yz4Bq88gS8DrPxpnT
 yl6Lk1vPownOY2QJlN2m8Jbprsm1OXrYq/imO6pqW4AH4cE7SThZyWprkfv/MgRSc3fi
 vW6r9MhMKdKVj8PDUZoOvmS609OOXxpjQdB/FbCHc0vGaHGUVt1CWvsNSgJAcRNi34Mh
 ztl3Fb6Zo0i801XexWCzDzNuqLXqo55C8xaPjakfHJcZXf78Dpxrkn1CsuvYTEvlRxFK
 JjqpzCkbVrBZ+dCBKwXGktNb8zUAqemHVm0KZDgt359YnyASLYhliMf/E1xE/coFSk9c
 Sj3g==
X-Gm-Message-State: AOAM530wn9mhiRQfZ/ybGjheUoiirrJ3boFYcfjIypU/EyWHVaCI4Xr+
 YdHS/gKTqwFS+XV72yQLVCtjbeaoJ3g/eJz6lhhqX1HMAf+VHsQ5exGJOlN938y/yONdapbvwXI
 DUAFqbuH9e6oWLs0=
X-Received: by 2002:a5d:4591:: with SMTP id p17mr3849349wrq.361.1606919151730; 
 Wed, 02 Dec 2020 06:25:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkteKvKlAppv76uELuk1Kx/fR/0spWEpLtExbz0wX+mE/qWXuUE1481kLahJ061yxlEE1gxg==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr3849315wrq.361.1606919151471; 
 Wed, 02 Dec 2020 06:25:51 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id o2sm2283690wrq.37.2020.12.02.06.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 06:25:50 -0800 (PST)
Subject: Re: check-tcg errors (build-user, build-user-plugins) again
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
 <87v9dksbkb.fsf@linaro.org> <b39faaa4-3be7-2e05-226c-7a3e50ab75af@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f7f41ce9-450d-f71d-fe69-74abd0593514@redhat.com>
Date: Wed, 2 Dec 2020 15:25:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b39faaa4-3be7-2e05-226c-7a3e50ab75af@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:25 PM, Claudio Fontana wrote:
> On 12/2/20 12:16 PM, Alex Bennée wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>>> Is there some pre-configuration on the host necessary to be able to
>>> run check-tcg?
>>
>> There shouldn't be but those errors remind me of some of the tweaks I
>> had to make to me Gentoo system when using podman (instead of docker).
>> In the end I think I just ended up adding the lines:
>>   
>>   alex:100000:65536
>>
>> to /etc/subgid and /etc/subgid-
>>
>> Marc-André may have some better pointers as he added podman support to
>> the builder scripts.

Not sure if helpful, but what worked for me is remove podman
and use docker... For sure I'm not testing podman, enough to
deal with docker.

> I did that and things seem a bit better, but still a lot of errors:
> 
> 
> 63      ../sysdeps/x86_64/start.S: No such file or directory.
> 
> Error: error creating build container: The following failures happened while trying to pull image specified by "debian:bullseye-slim" based on search registries in /etc/containers/registries.conf:
> * "localhost/debian:bullseye-slim": Error initializing source docker://localhost/debian:bullseye-slim: error pinging docker registry localhost: Get https://localhost/v2/: dial tcp [::1]:443: connect: connection refused
> * "docker.io/library/debian:bullseye-slim": Error committing the finished image: error adding layer with blob "sha256:ae63fcbbc3b289e425e4c8840ccde4314f4a060cbc0345e6871a28bdc72f6fe8": Error processing tar file(exit status 1): there might not be enough IDs available in the namespace (requested 0:42 for /etc/gshadow): lchown /etc/gshadow: invalid argument
> Traceback (most recent call last):
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 709, in <module>
>     sys.exit(main())
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 705, in main
>     return args.cmdobj.run(args, argv)
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 501, in run
>     extra_files_cksum=cksum)
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 354, in build_image
>     quiet=quiet)
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 244, in _do_check
>     return subprocess.check_call(self._command + cmd, **kwargs)
>   File "/usr/lib64/python3.6/subprocess.py", line 311, in check_call
>     raise CalledProcessError(retcode, cmd)
> 
> 
> [...]
> Error: error pulling image "registry.gitlab.com/qemu-project/qemu/qemu/fedora-cris-cross": unable to pull registry.gitlab.com/qemu-project/

Maybe you need "use explicit docker.io registry" from Daniel:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg763484.html

[...]


