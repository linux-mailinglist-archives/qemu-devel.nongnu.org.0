Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783E1D5804
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 19:34:06 +0200 (CEST)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZeDl-0002sH-8E
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 13:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZeCm-0002CJ-3b
 for qemu-devel@nongnu.org; Fri, 15 May 2020 13:33:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53818
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZeCi-00025p-GT
 for qemu-devel@nongnu.org; Fri, 15 May 2020 13:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589563979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52OLM6s/nYj4m30COoTE8+RYp0xFv8yuZm5onH3Mjtc=;
 b=cbpEdBSgIUcgdlwtR5uYhuvgTrpe9rf5HTCqfNYWA+MdaGN+zZZ48+o94lw8HPuROmEu5y
 0ZbviSWrk6CY5EGJPM5AnGDPO5CVbs0UJf9+osA2kG+wJNddNy7wFLvsuULAJAqIPRGj8P
 UXpo3yAeK0C/RpEQDbPIoLU6U0FcBaw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-AtK0HwwPNgiAPrH_UUdbQA-1; Fri, 15 May 2020 13:32:54 -0400
X-MC-Unique: AtK0HwwPNgiAPrH_UUdbQA-1
Received: by mail-wm1-f72.google.com with SMTP id e15so5691907wme.1
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 10:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=52OLM6s/nYj4m30COoTE8+RYp0xFv8yuZm5onH3Mjtc=;
 b=W2qnIU32EmaVqCKLr2wpMDgzQ82gOfM3iGi0uUvvilIIgrVzUSZZgNvhmTlTK8mlh7
 40UFXGWe2Ptzn4c32a26wuX5uKrrWmbGWF5QEBCNGFjxC20hLQ12wOEhGuGPveNfoV5w
 94Mawa8ovtmFJyj7Sq2QP8uHPRgP+iFlWgj7NGf2WHp+os3EsJTvmBuJLS26w92plH31
 N5uv8g6A3Z+W1L4k/foIJSF5OziM2WoKVZFDT/1oenEMy9a9sTSHnBl6AxmfsDeFsY+p
 5iZLCFtdbEc0kY3TFMyKS+WZmp/i14pyZldi7nmNMryeNo228PkuVtKgZnYVmXehGbgd
 MWVw==
X-Gm-Message-State: AOAM530LQA4ruLeB7YF2x99qPH4999gzLO/lyq70MrOijPtQiCL1htR8
 b2sqzEGEh2mhziXDwG2IHB4DNfSn7U5H6wMpb2Bt0E94D5g4VWAW7pNUefvnx/E9Znn9XPlwzMT
 OH0yg9FPpBMpjwGE=
X-Received: by 2002:adf:d0d1:: with SMTP id z17mr5685118wrh.175.1589563973602; 
 Fri, 15 May 2020 10:32:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYGMHkXBsuSYgLTkLrW5CO3Mef/uIk3l+BoRL4HcZN4sPcDmWr2SX4we05VRKzqKAzvXOj1Q==
X-Received: by 2002:adf:d0d1:: with SMTP id z17mr5685101wrh.175.1589563973360; 
 Fri, 15 May 2020 10:32:53 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 60sm4760103wrp.92.2020.05.15.10.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 10:32:52 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] tests/vm: pass --genisoimage to basevm script
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200515172831.8439-1-alex.bennee@linaro.org>
 <20200515172831.8439-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <74e58352-e965-6e4a-6744-4ee52f961916@redhat.com>
Date: Fri, 15 May 2020 19:32:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200515172831.8439-3-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, robert.foley@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/20 7:28 PM, Alex Bennée wrote:
> If we have an alternative to genisoimage we really need to tell the
> script about it as well so it can use it. It will still default to
> genisoimage in case it is run outside our build machinery.

Maybe worth mentioning it is a follow-up to commit 39d87c8c0c1.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/Makefile.include |  1 +
>   tests/vm/basevm.py        | 16 ++++++++++------
>   2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index 1bf9693d195..74ab522c55d 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -56,6 +56,7 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
>   	$(call quiet-command, \
>   		$(PYTHON) $< \
>   		$(if $(V)$(DEBUG), --debug) \
> +		$(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
>   		--image "$@" \
>   		--force \
>   		--build-image $@, \
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 756ccf7acae..a2d4054d72b 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -61,8 +61,9 @@ class BaseVM(object):
>       # 4 is arbitrary, but greater than 2,
>       # since we found we need to wait more than twice as long.
>       tcg_ssh_timeout_multiplier = 4
> -    def __init__(self, debug=False, vcpus=None):
> +    def __init__(self, debug=False, vcpus=None, genisoimage=None):
>           self._guest = None
> +        self._genisoimage = genisoimage
>           self._tmpdir = os.path.realpath(tempfile.mkdtemp(prefix="vm-test-",
>                                                            suffix=".tmp",
>                                                            dir="."))
> @@ -381,12 +382,12 @@ class BaseVM(object):
>               udata.writelines(["apt:\n",
>                                 "  proxy: %s" % proxy])
>           udata.close()
> -        subprocess.check_call(["genisoimage", "-output", "cloud-init.iso",
> +        subprocess.check_call([self._genisoimage, "-output", "cloud-init.iso",
>                                  "-volid", "cidata", "-joliet", "-rock",
>                                  "user-data", "meta-data"],
> -                               cwd=cidir,
> -                               stdin=self._devnull, stdout=self._stdout,
> -                               stderr=self._stdout)
> +                              cwd=cidir,
> +                              stdin=self._devnull, stdout=self._stdout,
> +                              stderr=self._stdout)
>   
>           return os.path.join(cidir, "cloud-init.iso")
>   
> @@ -424,6 +425,8 @@ def parse_args(vmcls):
>                         help="Interactively run command")
>       parser.add_option("--snapshot", "-s", action="store_true",
>                         help="run tests with a snapshot")
> +    parser.add_option("--genisoimage", default="genisoimage",
> +                      help="iso imaging tool")
>       parser.disable_interspersed_args()
>       return parser.parse_args()
>   
> @@ -435,7 +438,8 @@ def main(vmcls):
>               return 1
>           logging.basicConfig(level=(logging.DEBUG if args.debug
>                                      else logging.WARN))
> -        vm = vmcls(debug=args.debug, vcpus=args.jobs)
> +        vm = vmcls(debug=args.debug, vcpus=args.jobs,
> +                   genisoimage=args.genisoimage)
>           if args.build_image:
>               if os.path.exists(args.image) and not args.force:
>                   sys.stderr.writelines(["Image file exists: %s\n" % args.image,
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


