Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAF2FF10B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:52:59 +0100 (CET)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dCc-0001np-3i
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2d8J-0000rD-OM
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:48:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2d8F-0002PD-PJ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611247699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQmirT+RiaDohRNNAvi0iP6i2N4cMveT+0L0SVSYtOQ=;
 b=jDMxG4UdvIofI/T/vUgQJrNfv43adxLZtTMyqg5GTfwCtPWUyZi5EBxhcJ1FfmcEbFde3k
 Pm7CsdsF+mAiKUdSKe0lOs5TXs9nwoW4AITy1gjO8tINA6rmKBtJvFl5+0NoTAfXpKsQEH
 oiA20EBNTQSMqBTc6aAf0FMa5xt7r08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-cx32ogxLMSO2HeHML0lVQg-1; Thu, 21 Jan 2021 11:48:15 -0500
X-MC-Unique: cx32ogxLMSO2HeHML0lVQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D5901800D42;
 Thu, 21 Jan 2021 16:48:14 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45855F7D8;
 Thu, 21 Jan 2021 16:48:13 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-9-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v7 08/11] iotests: add testenv.py
Message-ID: <8088599e-fb3f-5296-6ced-12b09c911af2@redhat.com>
Date: Thu, 21 Jan 2021 10:48:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
> Add TestEnv class, which will handle test environment in a new python
> iotests running framework.
> 
> Difference with current ./check interface:
> - -v (verbose) option dropped, as it is unused
> 
> - -xdiff option is dropped, until somebody complains that it is needed
> - same for -n option
> - same for looking for binaries in $build_iotests directory.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/testenv.py | 255 ++++++++++++++++++++++++++++++++++
>  1 file changed, 255 insertions(+)
>  create mode 100644 tests/qemu-iotests/testenv.py
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> new file mode 100644
> index 0000000000..0fe5076088
> --- /dev/null
> +++ b/tests/qemu-iotests/testenv.py
> @@ -0,0 +1,255 @@
> +# TestEnv class to manage test environment variables.

Should this have permissions 755 and a #! python line?

> +def get_default_machine(qemu_prog: str) -> str:
> +    outp = subprocess.run([qemu_prog, '-machine', 'help'], check=True,
> +                          text=True, stdout=subprocess.PIPE).stdout
> +
> +    machines = outp.split('\n')
> +    default_machine = next(m for m in machines if m.endswith(' (default)'))
> +    default_machine = default_machine.split(' ', 1)[0]
> +
> +    alias_suf = ' (alias of {})'.format(default_machine)
> +    alias = next((m for m in machines if m.endswith(alias_suf)), None)
> +    if alias is not None:
> +        default_machine = alias.split(' ', 1)[0]
> +
> +    return default_machine

I have no idea if this is the most efficient and idiomatic way for
python to extract the default machine out of the output list, but it
seems to work.

> +
> +
> +class TestEnv(AbstractContextManager['TestEnv']):


> +        self.qsd_prog = os.getenv('QSD_PROG', root('storage-daemon',
> +                                                   'qemu-storage-daemon'))
> +
> +        for b in [self.qemu_img_prog, self.qemu_io_prog, self.qemu_nbd_prog,
> +                  self.qemu_prog, self.qsd_prog]:
> +            if not os.path.exists(b):
> +                sys.exit('Not such file: ' + b)

No such file


> +        if self.imgfmt == 'vmkd':

vmdk (which means we need to test that './check -vmdk' still works...)

I can see a rough correspondence to the existing shell code in ./check,
and with the entire series applied, things still work (other than vmdk,
which should work with the typo fix).  I'm not comfortable enough to
offer my full review of the python code, but I can give:

Tested-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


