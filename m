Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D534D7F69
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:07:40 +0100 (CET)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThc2-0001aH-Rh
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:07:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nThQG-00027e-Tu
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 05:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nThQC-0003bg-0D
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 05:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647251719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DOzbHhegizn46HRQcI/GbWl+pnIRJ+riPeMpxF2Vnns=;
 b=NiTjVi0d1nRW/ymH3j2MpBYGEm59nuUsTFBzPCw2W4ztQ6ykVKuLSAQ8KcunLAP/B/1KIb
 CjIX20P7IE3stGeK2hzJ3ng0dtekbEp4bGlDrp8XTK8FJToBzUmzN9rZzxGtdrFoncwwSx
 lqt0pBdKD2q+3YipG19sNCFzplxoZzU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-tf_yq_pfMRGY_m7qr-wLoA-1; Mon, 14 Mar 2022 05:55:17 -0400
X-MC-Unique: tf_yq_pfMRGY_m7qr-wLoA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l13-20020a7bcf0d000000b0038982c6bf8fso6817721wmg.7
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 02:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DOzbHhegizn46HRQcI/GbWl+pnIRJ+riPeMpxF2Vnns=;
 b=KVIYm2Vgwrk5xxP3IhlShr8WnbSgTkJwASlSx9GK8ybtkciijPXFnc8Oz3Xzg3AZfu
 c2UznHEZv8iKyovH71F8fbQ3YtoGPylez/jo5CutJopK65qNDbogTa4bdbQEHGMGmgrr
 Rf6U5nprgzFukG669NlCkdLhcQdXb3tPNND7yRvGwiOhkVUn/OaFiO036hDeNVOQSxJt
 8hWpBapV5K5TKJ43ZZ9Io4j8p0XxOB/UHOPNDVN6RepuZDMK9mrmf36s3WGBYK2uqlFD
 Y8nuZbsI96cPxrj2mE8h7UC4NhUeBaORKeISSVOiY8Kwy3PzedgDv2/d2U1olfuM9eFl
 P6+Q==
X-Gm-Message-State: AOAM531/YvWs4yMA90Bhc6k0n+2As4tf4DKyUPxQ4tNl+hG8v+FJVcvT
 0DtVcx8mXkVICWqDVeVBG2emJM3ysp7vhbmEw9dJc6altRndwaMdJORsFese2dMPx24hYJQe+2M
 sYU/WSlCkgqlxwSE=
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr15762589wro.497.1647251716133; 
 Mon, 14 Mar 2022 02:55:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf3sz5NAF16DNkcB+YST+EfnbO+MH7los4Bgd25O0NgtmEs2kezIzN1tf6qJ3gKTvKCOODKQ==
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr15762574wro.497.1647251715907; 
 Mon, 14 Mar 2022 02:55:15 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adfd0c6000000b001f1ffd04672sm12213758wrh.12.2022.03.14.02.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 02:55:15 -0700 (PDT)
Message-ID: <03fd437f-1c34-9abe-6b07-c0a4cf597a04@redhat.com>
Date: Mon, 14 Mar 2022 10:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] tests/avocado: starts PhoneServer upfront
To: Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
References: <20220311171127.2189534-1-bleal@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220311171127.2189534-1-bleal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
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
Cc: berrange@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/2022 18.11, Beraldo Leal wrote:
> Race conditions can happen with the current code, because the port that
> was available might not be anymore by the time the server is started.
> 
> By setting the port to 0, PhoneServer it will use the OS default
> behavior to get a free port, then we save this information so we can
> later configure the guest.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Beraldo Leal <bleal@redhat.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 9b056b5ce5..ac85e36a4d 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -18,7 +18,7 @@
>   import uuid
>   
>   import avocado
> -from avocado.utils import cloudinit, datadrainer, network, process, ssh, vmimage
> +from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
>   from avocado.utils.path import find_command
>   
>   #: The QEMU build root directory.  It may also be the source directory
> @@ -602,9 +602,6 @@ def prepare_cloudinit(self, ssh_pubkey=None):
>           self.log.info('Preparing cloudinit image')
>           try:
>               cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
> -            self.phone_home_port = network.find_free_port()
> -            if not self.phone_home_port:
> -                self.cancel('Failed to get a free port')
>               pubkey_content = None
>               if ssh_pubkey:
>                   with open(ssh_pubkey) as pubkey:
> @@ -614,7 +611,7 @@ def prepare_cloudinit(self, ssh_pubkey=None):
>                             password=self.password,
>                             # QEMU's hard coded usermode router address
>                             phone_home_host='10.0.2.2',
> -                          phone_home_port=self.phone_home_port,
> +                          phone_home_port=self.phone_server.server_port,
>                             authorized_key=pubkey_content)
>           except Exception:
>               self.cancel('Failed to prepare the cloudinit image')
> @@ -625,6 +622,8 @@ def set_up_boot(self):
>           self.vm.add_args('-drive', 'file=%s' % path)
>   
>       def set_up_cloudinit(self, ssh_pubkey=None):
> +        self.phone_server = cloudinit.PhoneHomeServer(('0.0.0.0', 0),
> +                                                      self.name)
>           cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
>           self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
>   
> @@ -635,7 +634,9 @@ def launch_and_wait(self, set_up_ssh_connection=True):
>                                                    logger=self.log.getChild('console'))
>           console_drainer.start()
>           self.log.info('VM launched, waiting for boot confirmation from guest')
> -        cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
> +        while not self.phone_server.instance_phoned_back:
> +            self.phone_server.handle_request()
> +
>           if set_up_ssh_connection:
>               self.log.info('Setting up the SSH connection')
>               self.ssh_connect(self.username, self.ssh_key)

Thank you very much, this indeed fixes my problem with find_free_port() in 
the related tests:

Tested-by: Thomas Huth <thuth@redhat.com>


