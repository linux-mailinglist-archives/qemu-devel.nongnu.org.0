Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBBF298831
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 09:20:02 +0100 (CET)
Received: from localhost ([::1]:50158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWxjR-0006nE-NA
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 04:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kWxhl-0006GB-7N
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kWxhg-00005t-QC
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603700287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1H1DfuBqGSpeIL505wDeLrLP7/OCx7lMSh/1DuXgFUE=;
 b=G9FFz6G+8/2Fu9NmFNL4obeKjzaH0SPUGb+6m/ooPKPnjIZmlUTH9t+pkt6byVkOt0Tnd7
 9eboXiknpKDLUHjNwasPY7nYRcsjf8/U7T1Fh4Hoi9x6PSAJb6wSiVUINcSgNG9oT5IKZa
 TFl6FrpAXKpVWpk65/O0ZjHOX0INqy0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-6nP8U0HZPXSbIfKGUNhHRQ-1; Mon, 26 Oct 2020 04:18:02 -0400
X-MC-Unique: 6nP8U0HZPXSbIfKGUNhHRQ-1
Received: by mail-wm1-f72.google.com with SMTP id s12so3842285wmj.0
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 01:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1H1DfuBqGSpeIL505wDeLrLP7/OCx7lMSh/1DuXgFUE=;
 b=uh/NHwLT4y4LpkoT2HBvB9Arai8+5QvzqTZJZKPNvowwbhE6ah3GKqZkF2mPfuhpPm
 FU6nQ4a5P6S0KcaUwSuwLRy+lBepR2WiYkew5LV3KqFX055TFx4FoQm0NuBjxRXkDwli
 TTL33pHxZJKrMWZjtk+RRgOtDbiONnOGa473OFJfWqbxm/iSoDa+Ne1i2CGX6uggLh3s
 z70+gVNK5GVbesXGQ2HF2fS2yGjZyp5CPbzUrnf4K+YjRHZzbTe+zRAKEmbXW1epttYh
 JxgZxv9ggU3JasDJvatEEBnv1EDe6J/N7NO/XyArfSALmxHg4k/KVs2QsotGjpQcRxCi
 CwTQ==
X-Gm-Message-State: AOAM530J7xkjV09Rs+V6fzitX9nWehlm3GC6/1XVAZWMi4P83yTyL4xa
 K4GtOcin56z5Xa4FkG6G8qbXyXiuY3UN1alpggxcKztyQWOGN2HCP6jV8eIW6TNY0PGZJkbOi70
 3e0+k7FpI6JT5tUM=
X-Received: by 2002:a5d:654d:: with SMTP id z13mr16453462wrv.6.1603700279764; 
 Mon, 26 Oct 2020 01:17:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq6IHEAO2uxEv16mo5Ddk0t5WyAdsQd5Rtfkb3WsXLB8W3Oh5rXApzedhG2T6mVFUo5f2M6w==
X-Received: by 2002:a5d:654d:: with SMTP id z13mr16453448wrv.6.1603700279549; 
 Mon, 26 Oct 2020 01:17:59 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id m9sm12894127wmc.31.2020.10.26.01.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 01:17:58 -0700 (PDT)
Subject: Re: [PATCH v2] tests/acceptance: Test case for detecting -object
 crashes
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20201009202905.1845802-1-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <498119cb-a524-7f36-824c-50ede8ecfc0f@redhat.com>
Date: Mon, 26 Oct 2020 09:17:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009202905.1845802-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo, Thomas,

On 10/9/20 10:29 PM, Eduardo Habkost wrote:
> Add a simple test case that will run QEMU directly (without QMP)
> just to check for crashes when using `-object`.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * "Running command:" log message instead of "Command:" (Cleber)
> * Use universal_newlines=True instead of encoding='utf-8' (Cleber)
> * Rename devices() to get_devices() (Cleber)
> * Use @avocado.fail_on(subprocess.CalledProcessError) (Cleber)
> * Reword test_crash() docstring (Cleber)
> * Reorder imports
> ---
>   tests/acceptance/object_option.py | 53 +++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 tests/acceptance/object_option.py
> 
> diff --git a/tests/acceptance/object_option.py b/tests/acceptance/object_option.py
> new file mode 100644
> index 0000000000..511c03a36f
> --- /dev/null
> +++ b/tests/acceptance/object_option.py
> @@ -0,0 +1,53 @@
> +# Copyright (c) 2020 Red Hat, Inc.
> +#
> +# Author:
> +#  Eduardo Habkost <ehabkost@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +import shlex
> +import subprocess
> +
> +import avocado
> +import avocado_qemu
> +
> +
> +class ObjectOption(avocado_qemu.Test):
> +    """Check if ``-object`` option behaves as expected"""
> +
> +    def run(self, cmd, *args, **kwargs):
> +        cmdstr = ' '.join(shlex.quote(c) for c in cmd)
> +        self.log.info("Running command: %s", cmdstr)
> +        return subprocess.run(cmd, universal_newlines=True, *args, **kwargs)
> +
> +    def get_devices(self):
> +        out = self.run([self.qemu_bin, '-object', 'help'],
> +                       check=True, stdout=subprocess.PIPE).stdout
> +        lines = out.split('\n')
> +        return [l.strip() for l in lines[1:] if l.strip()]
> +
> +    @avocado.fail_on(subprocess.CalledProcessError)
> +    def test_help(self):
> +        """Check if ``-object ...,help`` behaves as expected"""
> +        for device in self.get_devices():
> +            self.run([self.qemu_bin, '-object', '%s,help' % (device)],
> +                     check=True,
> +                     stdout=subprocess.DEVNULL)
> +
> +    @avocado.fail_on(subprocess.CalledProcessError)
> +    def test_crash(self):
> +        """Check that QEMU doesn't crash when using ``-object ...``"""
> +        for device in self.get_devices():
> +            r = self.run([self.qemu_bin, '-object',
> +                                '%s,id=obj0' % (device),
> +                                '-monitor', 'stdio'],
> +                         input='quit\n',
> +                         stdout=subprocess.DEVNULL,
> +                         stderr=subprocess.PIPE)
> +            if r.returncode not in (0, 1):
> +                self.log.warn("QEMU stderr: %s", r.stderr)
> +                self.log.warn("QEMU exit code: %d", r.returncode)
> +                if r.returncode < 0:
> +                    self.fail("QEMU crashed")
> +                else:
> +                    self.fail("Unexpected exit code")
> 

Eduardo, what is the "acceptance" (functional) part of this test?

Thomas, could this be written using the QTest framework instead?

Thanks,

Phil.


