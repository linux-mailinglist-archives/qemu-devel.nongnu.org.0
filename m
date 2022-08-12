Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531CB590E30
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 11:34:12 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMR3T-0005yG-6Z
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 05:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oMR0n-0004P5-C7
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 05:31:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38312 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oMR0i-0006R8-QK
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 05:31:23 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxryPWHfZiUCcPAA--.11459S3; 
 Fri, 12 Aug 2022 17:31:02 +0800 (CST)
Subject: Re: [PATCH for-7.1] docs/system/loongarch: Update the LoongArch
 document
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn, Waldemar Brodkorb <wbx@openadk.org>
References: <20220812091957.3338126-1-yangxiaojuan@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <3fd38b68-7d67-798b-7b63-f7eadd80dfe7@loongson.cn>
Date: Fri, 12 Aug 2022 17:31:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220812091957.3338126-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxryPWHfZiUCcPAA--.11459S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Ary8GrWkXF4rAw18Jr1DZFb_yoW3XFWUpF
 nI934xKr4kXr9akrsYg34fWr1ktrn3Gry3WF42yw1rC3yqy3sFgrn5ta4rXFZrA348Xry2
 qry8Cr1UW3WUW37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/8/12 下午5:19, Xiaojuan Yang wrote:
> 1. Add some information about how to boot the LoongArch virt
> machine by uefi bios and linux kernel and how to access the
> source code or binary file.
> 2. Move the explanation of LoongArch system emulation in the
> target/loongarch/README to docs/system/loongarch/loongson3.rst
>
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   docs/system/loongarch/loongson3.rst | 104 +++++++++++++++++++++++++---
>   target/loongarch/README             |  49 +------------
>   2 files changed, 97 insertions(+), 56 deletions(-)

Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> diff --git a/docs/system/loongarch/loongson3.rst b/docs/system/loongarch/loongson3.rst
> index fa3acd01c0..66bcd28030 100644
> --- a/docs/system/loongarch/loongson3.rst
> +++ b/docs/system/loongarch/loongson3.rst
> @@ -15,27 +15,115 @@ The ``virt`` machine supports:
>   - Gpex host bridge
>   - Ls7a RTC device
>   - Ls7a IOAPIC device
> -- Ls7a ACPI device
> +- ACPI GED device
>   - Fw_cfg device
>   - PCI/PCIe devices
>   - Memory device
> -- CPU device. Type: Loongson-3A5000.
> +- CPU device. Type: la464-loongarch-cpu.
>   
>   CPU and machine Type
>   --------------------
>   
>   The ``qemu-system-loongarch64`` provides emulation for virt
>   machine. You can specify the machine type ``virt`` and
> -cpu type ``Loongson-3A5000``.
> +cpu type ``la464-loongarch-cpu``.
>   
>   Boot options
>   ------------
>   
> -Now the ``virt`` machine can run test program in ELF format and the
> -method of compiling is in target/loongarch/README.
> +We can boot the LoongArch virt machine by specifying the uefi bios,
> +initrd, and linux kernel. And those source codes and binary files
> +can be accessed by following steps.
> +
> +(1) booting command:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-loongarch64 -machine virt -m 4G -cpu la464-loongarch-cpu \
> +      -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd initrd.img \
> +      -append "root=/dev/ram rdinit=/sbin/init consol e=ttyS0,115200" \
> +      --nographic
> +
> +Note: The running speed may be a little slow, as the performance of our
> +qemu and uefi bios is not perfect, and it is being fixed.
> +
> +(2) cross compiler tools:
> +
> +.. code-block:: bash
> +
> +  wget https://github.com/loongson/build-tools/releases/download/ \
> +  2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
> +
> +  tar -vxf loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
> +
> +(3) qemu compile configure option:
> +
> +.. code-block:: bash
> +
> +  ./configure --disable-rdma --disable-pvrdma --prefix=usr \
> +              --target-list="loongarch64-softmmu" \
> +              --disable-libiscsi --disable-libnfs --disable-libpmem \
> +              --disable-glusterfs --enable-libusb --enable-usb-redir \
> +              --disable-opengl --disable-xen --enable-spice \
> +              --enable-debug --disable-capstone --disable-kvm \
> +              --enable-profiler
> +  make
> +
> +(4) uefi bios source code and compile method:
> +
> +.. code-block:: bash
> +
> +  git clone https://github.com/loongson/edk2-LoongarchVirt.git
> +
> +  cd edk2-LoongarchVirt
> +
> +  git submodule update --init
> +
> +  export PATH=$YOUR_COMPILER_PATH/bin:$PATH
> +
> +  export WORKSPACE=`pwd`
> +
> +  export PACKAGES_PATH=$WORKSPACE/edk2-LoongarchVirt
> +
> +  export GCC5_LOONGARCH64_PREFIX=loongarch64-unknown-linux-gnu-
> +
> +  edk2-LoongarchVirt/edksetup.sh
> +
> +  make -C edk2-LoongarchVirt/BaseTools
> +
> +  build --buildtarget=DEBUG --tagname=GCC5 --arch=LOONGARCH64  --platform=OvmfPkg/LoongArchQemu/Loongson.dsc
> +
> +  build --buildtarget=RELEASE --tagname=GCC5 --arch=LOONGARCH64  --platform=OvmfPkg/LoongArchQemu/Loongson.dsc
> +
> +The efi binary file path:
> +
> +  Build/LoongArchQemu/DEBUG_GCC5/FV/QEMU_EFI.fd
> +
> +  Build/LoongArchQemu/RELEASE_GCC5/FV/QEMU_EFI.fd
> +
> +(5) linux kernel source code and compile method:
>   
>   .. code-block:: bash
>   
> -  $ qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 \
> -      -smp 1 -kernel hello -monitor none -display none \
> -      -chardev file,path=hello.out,id=output -serial chardev:output
> +  git clone https://github.com/loongson/linux.git
> +
> +  export PATH=$YOUR_COMPILER_PATH/bin:$PATH
> +
> +  export LD_LIBRARY_PATH=$YOUR_COMPILER_PATH/lib:$LD_LIBRARY_PATH
> +
> +  export LD_LIBRARY_PATH=$YOUR_COMPILER_PATH/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
> +
> +  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- loongson3_defconfig
> +
> +  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu-
> +
> +  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- install
> +
> +  make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- modules_install
> +
> +Note: The branch of linux source code is loongarch-next.
> +
> +(6) initrd file:
> +
> +  You can use busybox tool and the linux modules to make a initrd file. Or you can access the
> +  binary files: https://github.com/yangxiaojuan-loongson/qemu-binary
> diff --git a/target/loongarch/README b/target/loongarch/README
> index 1823375d04..0b9dc0d40a 100644
> --- a/target/loongarch/README
> +++ b/target/loongarch/README
> @@ -11,54 +11,7 @@
>   
>   - System emulation
>   
> -  Mainly emulate a virt 3A5000 board and ls7a bridge that is not exactly the same as the host.
> -  3A5000 support multiple interrupt cascading while here we just emulate the extioi interrupt
> -  cascading. LS7A1000 host bridge support multiple devices, such as sata, gmac, uart, rtc
> -  and so on. But we just realize the rtc. Others use the qemu common devices. It does not affect
> -  the general use. We also introduced the emulation of devices at docs/system/loongarch/virt.rst.
> -
> -  This version only supports running binary files in ELF format, and does not depend on BIOS and kernel file.
> -  You can compile the test program with 'make & make check-tcg' and run the test case with the following command:
> -
> -  1. Install LoongArch cross-tools on X86 machines.
> -
> -    Download cross-tools.
> -
> -      wget https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
> -
> -      tar -vxf loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz -C /opt
> -
> -    Config cross-tools env.
> -
> -      . setenv.sh
> -
> -      setenv.sh:
> -
> -          #!/bin/sh
> -          set -x
> -          CC_PREFIX=/opt/cross-tools
> -
> -          export PATH=$CC_PREFIX/bin:$PATH
> -          export LD_LIBRARY_PATH=$CC_PREFIX/lib:$LD_LIBRARY_PATH
> -          export LD_LIBRARY_PATH=$CC_PREFIX/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
> -          set +x
> -
> -  2. Test tests/tcg/multiarch.
> -
> -    ./configure --disable-rdma --disable-pvrdma --prefix=/usr  \
> -            --target-list="loongarch64-softmmu"  \
> -            --disable-libiscsi --disable-libnfs --disable-libpmem \
> -            --disable-glusterfs --enable-libusb --enable-usb-redir \
> -            --disable-opengl --disable-xen --enable-spice --disable-werror \
> -            --enable-debug --disable-capstone --disable-kvm --enable-profiler
> -
> -    cd  build/
> -
> -    make && make check-tcg
> -
> -    or
> -
> -    ./build/qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 -smp 1 -kernel build/tests/tcg/loongarch64-softmmu/hello -monitor none -display none -chardev file,path=hello.out,id=output -serial chardev:output
> +  You can reference docs/system/loongarch/loongson3.rst to get the information about system emulation of LoongArch.
>   
>   - Linux-user emulation
>   


