Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3113E3B045A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:28:13 +0200 (CEST)
Received: from localhost ([::1]:56678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfVj-0003B7-N0
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvfUs-0002Uo-Tk
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvfUp-0001Qn-De
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624364833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RezCyCm+8CqOmxH+eIeKDvtfn5CUbkgKg9dNoU+Mcco=;
 b=V5LUrD9Z3wAAlJul01daa5ddlMqBbUHG2w8Cg0E8UoaM+HVOnp1ho6Bhe0FEmXEMkb22nn
 8IWNqJxIvhgOdiwvaoS8do6CmkIQLWKqJrkDboo/LBMVMS5P7F3LlJDIOmzCBNVMaeFoK2
 hX4T8TP/SbAfU9RifClpNcwKKopjvOs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-E3YQ4K5iNdCROkK1UmQupA-1; Tue, 22 Jun 2021 08:27:11 -0400
X-MC-Unique: E3YQ4K5iNdCROkK1UmQupA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so9677080wrc.16
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 05:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RezCyCm+8CqOmxH+eIeKDvtfn5CUbkgKg9dNoU+Mcco=;
 b=Hpw66X5mf+ofH4+EfrveXdP+vIeOFzWXGcnsVvQjI4A7aOeJKPbwXElStIoK4juNV7
 dcPk3OC0DwM74WpqJF6uTXpcIQMSN9zlgZP9zGCIanLV32UVH5BxoK4MXWRU/wO3duMW
 Tgx4c44P7Q+tWJwedquHEPT+Mk/UYyQKi7r2tANsPiWtk4obK/QiJo3W+qPxeV58YaWo
 EU9nNeOtxyXTAVCZqk7xg748m7HWRz0frUA8bMbPwmCm4R24h9LD2TKsRFBcO5sedbKY
 Q77jyaTK0E/5nxnbSIqae5j5j+ngCLCUKeWR5gycHN1vE4cB/a9nhUzU1Ikx7riElWTB
 wDxQ==
X-Gm-Message-State: AOAM532CTSKqmd9LC/5g9sPCqY+UywzIn9kNfjVEl/mylodqeQaGEEZW
 RWryoA8TkYnbM3mmOvp/3hK9h6WvuM3Nyx5Ht00Nckcp8qaPvzUuY0VxTYGCm2/OowNQahykJEr
 iipvaPJWRhRcxn6Y=
X-Received: by 2002:a5d:650b:: with SMTP id x11mr4639169wru.198.1624364830804; 
 Tue, 22 Jun 2021 05:27:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye2BzswHwLprb0xl7qbgZdYHrq9T2/XqyqXI4y7wOf3JMgFoD8IpUv534xa82KWKstaTwIag==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr4639140wru.198.1624364830575; 
 Tue, 22 Jun 2021 05:27:10 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm2193759wmq.48.2021.06.22.05.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 05:27:10 -0700 (PDT)
Subject: Re: [PATCH] block/ssh: add support for sha256 host key fingerprints
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Pino Toscano <ptoscano@redhat.com>
References: <20210622115156.138458-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7df266d5-8df4-c063-4bbf-dbf9edf4df92@redhat.com>
Date: Tue, 22 Jun 2021 14:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622115156.138458-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 1:51 PM, Daniel P. Berrangé wrote:
> Currently the SSH block driver supports MD5 and SHA1 for host key
> fingerprints. This is a cryptographically sensitive operation and
> so these hash algorithms are inadequate by modern standards. This
> adds support for SHA256 which has been supported in libssh since
> the 0.8.1 release.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> Note I can't actually get iotest '207' to fully pass. It always
> complains that it can't validate the "known_hosts" file
> 
>   qemu-img: Could not open 'TEST_IMG': no host key was found in known_hosts
> 
> it seems to rely on some specific developer host setup that my
> laptop doesn't satisfy. It would be useful if any pre-requisite
> could be documented in the iotest.
> 
> At least the sha256 verification step I added to 207 does pass
> though.

+Pino

>  block/ssh.c                |  3 +++
>  qapi/block-core.json       |  3 ++-
>  tests/qemu-iotests/207     | 54 ++++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/207.out | 25 ++++++++++++++++++
>  4 files changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/block/ssh.c b/block/ssh.c
> index b51a031620..d008caf059 100644
> --- a/block/ssh.c
> +++ b/block/ssh.c
> @@ -442,6 +442,9 @@ static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error **errp)
>          } else if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_SHA1) {
>              return check_host_key_hash(s, hkc->u.hash.hash,
>                                         SSH_PUBLICKEY_HASH_SHA1, errp);
> +        } else if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_SHA256) {
> +            return check_host_key_hash(s, hkc->u.hash.hash,
> +                                       SSH_PUBLICKEY_HASH_SHA256, errp);

Easier to read as a switch() :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          }
>          g_assert_not_reached();
>          break;
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2ea294129e..4247dc46a5 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3186,11 +3186,12 @@
>  #
>  # @md5: The given hash is an md5 hash
>  # @sha1: The given hash is an sha1 hash
> +# @sha256: The given hash is an sha256 hash
>  #
>  # Since: 2.12
>  ##
>  { 'enum': 'SshHostKeyCheckHashType',
> -  'data': [ 'md5', 'sha1' ] }
> +  'data': [ 'md5', 'sha1', 'sha256' ] }
>  
>  ##
>  # @SshHostKeyHash:
> diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
> index f9f3fd7131..0f5c4bc8a0 100755
> --- a/tests/qemu-iotests/207
> +++ b/tests/qemu-iotests/207
> @@ -73,6 +73,9 @@ with iotests.FilePath('t.img') as disk_path, \
>      iotests.log("=== Test host-key-check options ===")
>      iotests.log("")
>  
> +    iotests.log("--- no host key checking --")
> +    iotests.log("")
> +
>      vm.launch()
>      blockdev_create(vm, { 'driver': 'ssh',
>                            'location': {
> @@ -90,6 +93,9 @@ with iotests.FilePath('t.img') as disk_path, \
>  
>      iotests.img_info_log(remote_path)
>  
> +    iotests.log("--- known_hosts key checking --")
> +    iotests.log("")
> +
>      vm.launch()
>      blockdev_create(vm, { 'driver': 'ssh',
>                            'location': {
> @@ -115,6 +121,7 @@ with iotests.FilePath('t.img') as disk_path, \
>      # Mappings of base64 representations to digests
>      md5_keys = {}
>      sha1_keys = {}
> +    sha256_keys = {}
>  
>      for key in keys:
>          md5_keys[key] = subprocess.check_output(
> @@ -125,6 +132,10 @@ with iotests.FilePath('t.img') as disk_path, \
>              'echo %s | base64 -d | sha1sum -b | cut -d" " -f1' % key,
>              shell=True).rstrip().decode('ascii')
>  
> +        sha256_keys[key] = subprocess.check_output(
> +            'echo %s | base64 -d | sha256sum -b | cut -d" " -f1' % key,
> +            shell=True).rstrip().decode('ascii')
> +
>      vm.launch()
>  
>      # Find correct key first
> @@ -150,6 +161,9 @@ with iotests.FilePath('t.img') as disk_path, \
>          vm.shutdown()
>          iotests.notrun('Did not find a key that fits 127.0.0.1')
>  
> +    iotests.log("--- explicit md5 key checking --")
> +    iotests.log("")
> +
>      blockdev_create(vm, { 'driver': 'ssh',
>                            'location': {
>                                'path': disk_path,
> @@ -164,6 +178,7 @@ with iotests.FilePath('t.img') as disk_path, \
>                                }
>                            },
>                            'size': 2097152 })
> +
>      blockdev_create(vm, { 'driver': 'ssh',
>                            'location': {
>                                'path': disk_path,
> @@ -182,6 +197,9 @@ with iotests.FilePath('t.img') as disk_path, \
>  
>      iotests.img_info_log(remote_path)
>  
> +    iotests.log("--- explicit sha1 key checking --")
> +    iotests.log("")
> +
>      vm.launch()
>      blockdev_create(vm, { 'driver': 'ssh',
>                            'location': {
> @@ -215,6 +233,42 @@ with iotests.FilePath('t.img') as disk_path, \
>  
>      iotests.img_info_log(remote_path)
>  
> +    iotests.log("--- explicit sha256 key checking --")
> +    iotests.log("")
> +
> +    vm.launch()
> +    blockdev_create(vm, { 'driver': 'ssh',
> +                          'location': {
> +                              'path': disk_path,
> +                              'server': {
> +                                  'host': '127.0.0.1',
> +                                  'port': '22'
> +                              },
> +                              'host-key-check': {
> +                                  'mode': 'hash',
> +                                  'type': 'sha256',
> +                                  'hash': 'wrong',
> +                              }
> +                          },
> +                          'size': 2097152 })
> +    blockdev_create(vm, { 'driver': 'ssh',
> +                          'location': {
> +                              'path': disk_path,
> +                              'server': {
> +                                  'host': '127.0.0.1',
> +                                  'port': '22'
> +                              },
> +                              'host-key-check': {
> +                                  'mode': 'hash',
> +                                  'type': 'sha256',
> +                                  'hash': sha256_keys[matching_key],
> +                              }
> +                          },
> +                          'size': 4194304 })
> +    vm.shutdown()
> +
> +    iotests.img_info_log(remote_path)
> +
>      #
>      # Invalid path and user
>      #
> diff --git a/tests/qemu-iotests/207.out b/tests/qemu-iotests/207.out
> index 1239d9d648..aeb8569d77 100644
> --- a/tests/qemu-iotests/207.out
> +++ b/tests/qemu-iotests/207.out
> @@ -16,6 +16,8 @@ virtual size: 4 MiB (4194304 bytes)
>  
>  === Test host-key-check options ===
>  
> +--- no host key checking --
> +
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"mode": "none"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 8388608}}}
>  {"return": {}}
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
> @@ -25,6 +27,8 @@ image: TEST_IMG
>  file format: IMGFMT
>  virtual size: 8 MiB (8388608 bytes)
>  
> +--- known_hosts key checking --
> +
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"mode": "known_hosts"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 4194304}}}
>  {"return": {}}
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
> @@ -34,6 +38,8 @@ image: TEST_IMG
>  file format: IMGFMT
>  virtual size: 4 MiB (4194304 bytes)
>  
> +--- explicit md5 key checking --
> +
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "md5"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
>  {"return": {}}
>  Job failed: remote host key does not match host_key_check 'wrong'
> @@ -49,6 +55,8 @@ image: TEST_IMG
>  file format: IMGFMT
>  virtual size: 8 MiB (8388608 bytes)
>  
> +--- explicit sha1 key checking --
> +
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "sha1"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
>  {"return": {}}
>  Job failed: remote host key does not match host_key_check 'wrong'
> @@ -64,6 +72,23 @@ image: TEST_IMG
>  file format: IMGFMT
>  virtual size: 4 MiB (4194304 bytes)
>  
> +--- explicit sha256 key checking --
> +
> +{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "sha256"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
> +{"return": {}}
> +Job failed: remote host key does not match host_key_check 'wrong'
> +{"execute": "job-dismiss", "arguments": {"id": "job0"}}
> +{"return": {}}
> +
> +{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "HASH", "mode": "hash", "type": "sha256"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 4194304}}}
> +{"return": {}}
> +{"execute": "job-dismiss", "arguments": {"id": "job0"}}
> +{"return": {}}
> +
> +image: TEST_IMG
> +file format: IMGFMT
> +virtual size: 4 MiB (4194304 bytes)
> +
>  === Invalid path and user ===
>  
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"mode": "none"}, "path": "/this/is/not/an/existing/path", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 4194304}}}
> 


