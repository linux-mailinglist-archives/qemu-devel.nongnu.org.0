Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171062CBBD5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:50:21 +0100 (CET)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQeJ-0001KC-Mk
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kkQG0-0000Aq-Mk
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:25:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:57776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kkQFw-0002al-UV
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:25:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9300AB7F;
 Wed,  2 Dec 2020 11:25:06 +0000 (UTC)
Subject: Re: check-tcg errors (build-user, build-user-plugins) again
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
 <87v9dksbkb.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b39faaa4-3be7-2e05-226c-7a3e50ab75af@suse.de>
Date: Wed, 2 Dec 2020 12:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87v9dksbkb.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:16 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Hi Alex and all,
>>
>> when trying to use check-tcg (master), I am getting often these errors:
>>
>> $ ../configure --disable-system --disable-tools
>>
>> $ make -j12 check-tcg
>>
>> ERRO[0000] cannot find mappings for user claudio: No subgid ranges found for group "claudio" in /etc/subgid 
>> ERRO[0000] cannot find mappings for user claudio: No subgid ranges found for group "claudio" in /etc/subgid 
>> ERRO[0000] cannot find mappings for user claudio: No subgid ranges found for group "claudio" in /etc/subgid 
>> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian11...
>> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/fedora-cris-cross...
>> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian10...
>> ERRO[0000] cannot find mappings for user claudio: No subgid ranges found for group "claudio" in /etc/subgid 
>>
>> [...]
>>   TEST    linux-test on x86_64
>> timeout: failed to run command ‘/home/claudio/git/qemu/build/qemu-x86_64’timeout: : No such file or directoryfailed to run command ‘/home/claudio/git/qemu/build/qemu-x86_64’
>>
>> [...]
>>
>>
>> Is there some pre-configuration on the host necessary to be able to
>> run check-tcg?
> 
> There shouldn't be but those errors remind me of some of the tweaks I
> had to make to me Gentoo system when using podman (instead of docker).
> In the end I think I just ended up adding the lines:
>   
>   alex:100000:65536
> 
> to /etc/subgid and /etc/subgid-
> 
> Marc-André may have some better pointers as he added podman support to
> the builder scripts.


I did that and things seem a bit better, but still a lot of errors:


63      ../sysdeps/x86_64/start.S: No such file or directory.

Error: error creating build container: The following failures happened while trying to pull image specified by "debian:bullseye-slim" based on search registries in /etc/containers/registries.conf:
* "localhost/debian:bullseye-slim": Error initializing source docker://localhost/debian:bullseye-slim: error pinging docker registry localhost: Get https://localhost/v2/: dial tcp [::1]:443: connect: connection refused
* "docker.io/library/debian:bullseye-slim": Error committing the finished image: error adding layer with blob "sha256:ae63fcbbc3b289e425e4c8840ccde4314f4a060cbc0345e6871a28bdc72f6fe8": Error processing tar file(exit status 1): there might not be enough IDs available in the namespace (requested 0:42 for /etc/gshadow): lchown /etc/gshadow: invalid argument
Traceback (most recent call last):
  File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 709, in <module>
    sys.exit(main())
  File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 705, in main
    return args.cmdobj.run(args, argv)
  File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 501, in run
    extra_files_cksum=cksum)
  File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 354, in build_image
    quiet=quiet)
  File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib64/python3.6/subprocess.py", line 311, in check_call
    raise CalledProcessError(retcode, cmd)


[...]
Error: error pulling image "registry.gitlab.com/qemu-project/qemu/qemu/fedora-cris-cross": unable to pull registry.gitlab.com/qemu-project/

[...]



> 
> The main difference between the images on the registry and the local
> versions is most add the current user so there is a clean mapping
> between the container user and the host file-system. It's the last step
> of the build so we still use the cached layers from the registry
> versions.
> 
>> I see these errors in gitlab also for
>>
>> build-user
>> build-user-plugin
>>
>> Maybe this is what Philippe mentioned before though, that this is
>> expected at the moment due to a temporary Meson shortcoming?
> 
> That is odd - I'm not seeing anything like that on the master builds:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/883985106
>   https://gitlab.com/qemu-project/qemu/-/jobs/883985113
> 
> AFAIK GitLab is still using Docker to build it's containers (albeit with
> BUILDKIT enabled).


I am running again on gitlab the master branch, maybe there is something I need to fix, but to do that I need to enable check-tcg successfully I think.

Thanks!

Claudio

>   
>>
>> Ciao,
>>
>> Claudio
> 
> 


