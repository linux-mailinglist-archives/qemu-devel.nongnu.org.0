Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0CF3A87E7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:43:07 +0200 (CEST)
Received: from localhost ([::1]:36184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltD5e-0001qI-U7
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ltD3K-0007zJ-9g
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ltD3I-0003L9-Dt
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778839;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4IYumj36l5y+efs6brSOhsImvkN+Ocopgpp3biVmzw0=;
 b=RmDpjrEoObR7tli+7L2uKluaYy1MU6U9FpYVWRo0s4ee1R7HMXqfVS5F4dK5YfFAxCBbit
 xFXNPH75YLIxE+7Sa4tiZGRKzJ9npA99aXNZOOBHn3qlvhzipZgxPE4ehwV35PequJv/94
 Gva6algK0JwGEattnBJ3c96GFJlrTv8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-VKUldgFSNTiaXOW_1UuVFQ-1; Tue, 15 Jun 2021 13:40:37 -0400
X-MC-Unique: VKUldgFSNTiaXOW_1UuVFQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 n17-20020ad444b10000b02902157677ec50so84105qvt.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4IYumj36l5y+efs6brSOhsImvkN+Ocopgpp3biVmzw0=;
 b=Ir4V17L/eSrHUcfnKWL5saBvGz6oww8VJjjjTp+pDzKjLQzZe3yujp79KCBencMlQ/
 Zcdmdg1zK6iq/ntfIwi/J/TIVnDSs2WUhpFoGNmBsoNGQJ702wMV+yEXDntl+PX7BEuL
 YzpuDRbUR9cIWZFQelwoRxcZce96wPg6PfW90PyJyyW32jRIEE1D7enEqcH2MBz8roRI
 wT/jpPspDd4plgMxO6+9v+uIlPG3izqAJURvd761g9BmNSuJ0brB/DzVljiuGnlxCTXC
 ziCPUHtadAPySz6/NDpJLOLqo1vQ2buubR5Y7ST4/bQz0MftYaXFGh6+9Ydkaak3CN7J
 jdmA==
X-Gm-Message-State: AOAM533gRB0Ud4u+gy/PfVnXLk758PCE8fPXOTOMTDt8/WeaAh9xLa/G
 gEBZjg+aC/ANoM+fLod9W2zrWaVmG2YYqGGzia7WYGWU82CJp8Cvn7RJVOEHhPATFWYNDasU0Tx
 X724BGNAGhnk7kfw=
X-Received: by 2002:a0c:c30e:: with SMTP id f14mr6641762qvi.19.1623778837089; 
 Tue, 15 Jun 2021 10:40:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiwM22K5d59H6/XCi1FExxE2H52bkneOGn3KM+GOG+YVWY+5rUcnMGZEBMqgXy08s2luyIcQ==
X-Received: by 2002:a0c:c30e:: with SMTP id f14mr6641743qvi.19.1623778836877; 
 Tue, 15 Jun 2021 10:40:36 -0700 (PDT)
Received: from wainer-laptop.localdomain ([177.69.178.131])
 by smtp.gmail.com with ESMTPSA id g15sm12631714qkl.53.2021.06.15.10.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 10:40:36 -0700 (PDT)
Subject: Re: [PATCH] tests/vm/freebsd: Increase code coverage
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
References: <20210531100348.1655156-1-f4bug@amsat.org>
 <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
 <YMjdCjNOyUnprhd8@redhat.com> <YMjhFXKFi2H+Zkme@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d4ee4cf1-26e9-7344-f29f-ed242464e9dc@redhat.com>
Date: Tue, 15 Jun 2021 14:40:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMjhFXKFi2H+Zkme@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/15/21 2:19 PM, Daniel P. Berrangé wrote:
> On Tue, Jun 15, 2021 at 06:02:02PM +0100, Daniel P. Berrangé wrote:
>> On Mon, May 31, 2021 at 05:53:25PM -0300, Wainer dos Santos Moschetta wrote:
>>> Hi,
>>>
>>> On 5/31/21 7:03 AM, Philippe Mathieu-Daudé wrote:
>>>> Install more dependencies to increase code coverage.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>    tests/vm/freebsd | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>> With or without this patch I got an error when `make vm-build-freebsd`. It
>>> fails to install packages.
>>>
>>> For example, with this patch I got:
>>>
>>> < Output omitted>
>>>
>>> ### Installing packages ...
>>> Failed to prepare guest environment
>>> Traceback (most recent call last):
>>>    File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 634, in main
>>>      return vm.build_image(args.image)
>>>    File "/home/wmoschet/src/qemu/tests/vm/freebsd", line 206, in build_image
>>>      self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>>>    File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 255, in
>>> ssh_root_check
>>>      self._ssh_do(self._config["root_user"], cmd, True)
>>>    File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 242, in _ssh_do
>>>      raise Exception("SSH command failed: %s" % cmd)
>>> Exception: SSH command failed: pkg install -y git pkgconf bzip2 python37
>>> ninja bash gmake gsed gettext cyrus-sasl gnutls nettle jpeg-turbo png sdl2
>>> gtk3 libxkbcommon pixman libepoxy mesa-libs zstd usbredir
>>>
>>> Is it a known issue?
>> Hard to actually tell what the error really is. This message is
>> only giving the command that was invoked, but seems to have thrown
>> away stdout/stderr which would have the messages telling us what
>> went wrong.  This lack of error reporting in basevm.py so badly
>> needs to be fixed, otherwise we're working blind when debugging
>> failures.
> Hmm, when I try the same command, it *does* print all the output
> so you can see what's going on, but it doesn't actually fail for
> me either (without this patch).

Thomas sent me a message in private while ago that the error could be 
related with the amount of ssh keys in my agent-ssh. I didn' t check 
that hypothesis yet; will debug a littler further and let you all posted.

ah, if this problem cannot be reproduced on other machines....I see no 
reason to hold this patch.

- Wainer

>
> Regards,
> Daniel


